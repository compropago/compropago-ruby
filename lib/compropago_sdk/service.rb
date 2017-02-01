class Service

  def initialize(client)
    @client = client
  end

  def get_auth
    { :user => @client.get_user, :pass => @client.get_pass }
  end

  def list_providers(limit=0, currency='MXN')
    uri = @client.deploy_uri+'providers/'

    if limit > 0
      uri = uri+'?order_total='+limit.to_s
    end

    if limit > 0 && !currency.nil? && currency != 'MXN'
      uri = uri+'&currency='+currency
    end

    response = Request::get(uri, get_auth)

    Factory::get_instance_of 'ListProviders', response
  end

  def verify_order(order_id)
    response = Request::get( @client.deploy_uri+'charges/'+order_id+'/', get_auth)

    Factory::get_instance_of 'CpOrderInfo', response
  end

  def place_order(order)
    unless order.is_a?(PlaceOrderInfo)
      raise 'Order object is not valid'
    end

    params = {
        :order_id => order.order_id,
        :order_name => order.order_name,
        :order_price => order.order_price,
        :customer_name => order.customer_name,
        :customer_email => order.customer_email,
        :payment_type => order.payment_type,
        :currency => order.currency,
        :expiration_time => order.expiration_time,
        :image_url => order.image_url,
        :app_client_name => order.app_client_name,
        :app_client_version => order.app_client_version
    }

    response = Request::post(@client.deploy_uri+'charges/', params, get_auth)

    Factory::get_instance_of 'NewOrderInfo', response
  end

  def send_sms_instructions(number, order_id)
    params = {customer_phone: number}

    response = Request::post(@client.deploy_uri+'charges/'+order_id+'/sms/', params, get_auth)

    Factory::get_instance_of 'SmsInfo', response
  end

  def create_webhook(url)
    params = {url: url}

    response = Request::post(@client.deploy_uri+'webhooks/stores/', params, get_auth)

    Factory::get_instance_of 'Webhook', response
  end

  def update_webhook(webhook_id, new_url)
    params = {url: new_url}

    response = Request::put(@client.deploy_uri+'webhooks/stores/'+webhook_id+'/', params, get_auth)

    Factory::get_instance_of 'Webhook', response
  end

  def delete_webhook(webhook_id)
    response = Request::delete(@client.deploy_uri+'webhooks/stores/'+webhook_id, nil, get_auth)

    Factory::get_instance_of 'Webhook', response
  end

  def list_webhooks
    response = Request::get(@client.deploy_uri+'webhooks/stores/', get_auth)

    Factory::get_instance_of 'ListWebhooks', response
  end

end
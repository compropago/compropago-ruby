class Service
  # Constructor
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def initialize(client)
    @client = client
  end

  # Get auth params
  #
  # @return [Hash] 
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def get_auth
    { :user => @client.get_user, :pass => @client.get_pass }
  end

  # List providers by limit and currency
  #
  # @param [float] limit      limite de transaccion de los proveedores
  # @param [string] currency
  # @return [Array]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def list_providers(limit=0, currency='MXN')
    uri = @client.deploy_uri+'providers/'

    if limit > 0
      uri = uri+'?order_total='+limit.to_s
    end

    if limit > 0 && !currency.nil? && currency != 'MXN'
      uri = uri+'&currency='+currency
    end

    response = EasyRequest::get(uri, get_auth())
    Factory::get_instance_of('ListProviders', response)
  end

  # Verify order by unique_id
  #
  # @param [string] order_id
  # @return [CpOrderInfo]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def verify_order(order_id)
    response = EasyRequest::get( @client.deploy_uri+'charges/'+order_id+'/', get_auth())
    Factory::get_instance_of('CpOrderInfo', response)
  end

  # Place order 
  #
  # @param [PlaceOrderInfo] order
  # @return [NewOrderInfo]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def place_order(order)
    unless order.is_a?(PlaceOrderInfo)
      raise 'Order object is not valid'
    end

    params = {
      order_id: order.order_id,
      order_name: order.order_name,
      order_price: order.order_price,
      customer_name: order.customer_name,
      customer_email: order.customer_email,
      payment_type: order.payment_type,
      currency: order.currency,
      expiration_time: order.expiration_time,
      image_url: order.image_url,
      app_client_name: order.app_client_name,
      app_client_version: order.app_client_version
    }

    response = EasyRequest::post(@client.deploy_uri+'charges/', params, get_auth())
    Factory::get_instance_of('NewOrderInfo', response)
  end

  # Send sms of an order
  #
  # @param [string] number    phone number
  # @param [string] order_id  id de la orden generada
  # @return [SmsInfo]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def send_sms_instructions(number, order_id)
    params = {customer_phone: number}
    response = EasyRequest::post(@client.deploy_uri+'charges/'+order_id+'/sms/', params, get_auth())
    Factory::get_instance_of('SmsInfo', response)
  end

  # Creatre webhook
  #
  # @param [string] url
  # @return [Webhook]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def create_webhook(url)
    params = {url: url}
    response = EasyRequest::post(@client.deploy_uri+'webhooks/stores/', params, get_auth())
    Factory::get_instance_of('Webhook', response)
  end

  # Update registered webhook
  #
  # @param [string] webhook_id  registered webhook ID
  # @param [string] new_url     new url for the webhook
  # @return [Webhook]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def update_webhook(webhook_id, new_url)
    params = {url: new_url}
    response = EasyRequest::put(@client.deploy_uri+'webhooks/stores/'+webhook_id+'/', params, get_auth())
    Factory::get_instance_of('Webhook', response)
  end

  # Delete webhook
  #   
  # @param [string] webhook_id registered webhook ID
  # @param [Webhook]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def delete_webhook(webhook_id)
    response = EasyRequest::delete(@client.deploy_uri+'webhooks/stores/'+webhook_id, nil, get_auth())
    Factory::get_instance_of('Webhook', response)
  end

  # Get list registered webhooks
  #
  # @return [Array]
  #
  # @author Eduardo Aguilar <dante.aguilar41@gmail.com>
  def list_webhooks
    response = EasyRequest::get(@client.deploy_uri+'webhooks/stores/', get_auth())
    Factory::get_instance_of('ListWebhooks', response)
  end
end
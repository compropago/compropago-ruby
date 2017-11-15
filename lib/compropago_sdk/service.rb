class Service
  # FUNCTION: constructor
  def initialize(client)
    @client = client
  end

  # FUNCTION: get auth params
  # @return [Hash] 
  def get_auth
    { :user => @client.get_user, :pass => @client.get_pass }
  end

  # FUNCTION: list providers by limit and currency
  # @param limit    [Float]  limite de transaccion de los proveedores
  # @param currency [String] 
  def list_providers(limit=0, currency='MXN')
    uri = @client.deploy_uri+'providers/'

    if limit > 0
      uri = uri+'?order_total='+limit.to_s
    end

    if limit > 0 && !currency.nil? && currency != 'MXN'
      uri = uri+'&currency='+currency
    end

    response = EasyRequest::get(uri, get_auth())

    Factory::get_instance_of 'ListProviders', response
  end

  # FUNCTION: veridy order by unique_id
  # @return [CpOrderInfo]
  def verify_order(order_id)
    response = EasyRequest::get( @client.deploy_uri+'charges/'+order_id+'/', get_auth())

    Factory::get_instance_of 'CpOrderInfo', response
  end

  # FUNCTION: place order 
  # @param order [PlaceOrderInfo]
  # @return [NewOrderInfo]
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
      app_client_version: order.app_client_version,
      ip_address: get_ip()
    }

    puts params

    response = EasyRequest::post(@client.deploy_uri+'charges/', params, get_auth())

    Factory::get_instance_of 'NewOrderInfo', response
  end

  # FUNCTION: send sms of an order
  # @param number   [String]  phone number
  # @param order_id [String]  id de la orden generada
  # @return [SmsInfo]
  def send_sms_instructions(number, order_id)
    params = {customer_phone: number}

    response = EasyRequest::post(@client.deploy_uri+'charges/'+order_id+'/sms/', params, get_auth())

    Factory::get_instance_of 'SmsInfo', response
  end

  # FUNCTION: creatre webhook
  # @param url [String] url for the new webhook
  # @return [Webhook]
  def create_webhook(url)
    params = {url: url}

    response = EasyRequest::post(@client.deploy_uri+'webhooks/stores/', params, get_auth())

    Factory::get_instance_of 'Webhook', response
  end

  # FUNCTION: update registered webhook
  # @param webhook_id [String] registered webhook ID
  # @param new_url    [String] new url for the webhook
  # @return  [Webhook]
  def update_webhook(webhook_id, new_url)
    params = {url: new_url}

    response = EasyRequest::put(@client.deploy_uri+'webhooks/stores/'+webhook_id+'/', params, get_auth())

    Factory::get_instance_of 'Webhook', response
  end

  # FUNCTION: delete webhook
  # @param webhook_id [String] registered webhook ID
  # @param [Webhook]
  def delete_webhook(webhook_id)
    response = EasyRequest::delete(@client.deploy_uri+'webhooks/stores/'+webhook_id, nil, get_auth())

    Factory::get_instance_of 'Webhook', response
  end

  # FUNCTION: get list registered webhooks
  # @return [ListWebhooks]
  def list_webhooks
    response = EasyRequest::get(@client.deploy_uri+'webhooks/stores/', get_auth())

    Factory::get_instance_of 'ListWebhooks', response
  end

  # FUNCTION: send async glocation for an order
  # @param order_id [String] id de la orden generada
  # @param latitud  [Int]    latitud de localizacion
  # @param longitud [Int]    longitud de localizacion
  def send_glocation(order_id, latitud, longitud)
    begin
      data = {
        latitud: latitud,
        longitud: longitud,
        order_id: order_id
      }

      response = EasyRequest.post(@client.deploy_uri+'glocation', data, get_auth())
      puts response
    rescue => exception
      puts exception.message
    end
  end

  # FUNCTION: get real IP request
  # @return [String]
  private def get_ip
    return Net::HTTP.get URI "https://api.ipify.org"
  end
end
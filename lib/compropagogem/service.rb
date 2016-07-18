class Service

  # @param [Client] client
  def initialize(client)
    @client = client
    @headers = {
        :useragent => client.get_contained
    }
  end


  # @param [Bolean] auth
  # @param [Float] limit
  # @param [Bolean] fetch
  # @return [Array]
  def list_providers(auth = false, limit = 0.0, fetch = false)
    if auth === true
      Validations.validate_gateway self.client
    end

    url = auth ? "#{@client.get_uri}providers" : "#{@client.get_uri}providers/true"

    url = (limit > 0) ? "#{url}?order_total=#{limit}" : url

    if fetch
      if limit > 0
        url = "#{url}&fetch=true"
      else
        url = "#{url}?fetch=true"
      end
    end

    uri = URI(url)
    req = Net::HTTP::Get.new(uri)

    if auth
      req.basic_auth @client.get_user , @client.get_pass
    end

    res = Net::HTTP.start(uri.hostname, uri.port) { |http|
      http.request(req)
    }



    if auth === true
      case res
        when Net::HTTPSuccess
          json = JSON.parse(res.body)
          obj = Factory.list_providers json
          return obj
        else
          raise 'Error al recuperar los proveedores'
      end
    else
      json = JSON.parse(res.body)
      obj = Factory.list_providers json
      return obj
    end
  end


  # @param [PlaceOrderInfo] info
  # @return [NewOrderInfo]
  def place_order(info)
    Validations.validate_gateway @client

    uri = URI("#{@client.get_uri}charges/")
    req = Net::HTTP::Post.new(uri)

    req.basic_auth @client.get_user , @client.get_pass

    req.add_field('Content-Type', 'application/json')

    req.body = {
        order_id: info.order_id,
        order_price: info.order_price,
        order_name: info.order_name,
        customer_name: info.customer_name,
        customer_email: info.customer_email,
        image_url: info.image_url,
        payment_type: info.payment_type,
        app_client_name: info.app_client_name,
        app_client_version: info.app_client_version
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.new_order_info json
        return obj

        # return res.body
      else
        raise 'Se produjo un error al generar la orden.'
    end
  end


  # @param [String] id
  # @return [CpOrderInfo]
  def verify_order(id)
    Validations.validate_gateway @client

    uri = URI "#{@client.get_uri}charges/#{id}"
    req = Net::HTTP::Get.new uri

    req.basic_auth @client.get_user , @client.get_pass

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.cp_order_info json
        return obj

        # return res.body
      else
        raise 'Ocurrio un error al verificar la orden'
    end
  end


  def send_sms_instructions(number, id)
    Validations.validate_gateway @client

    uri = URI "#{@client.get_uri}charges/#{id}/sms"
    req = Net::HTTP::Post.new uri

    req.basic_auth @client.get_user , @client.get_pass

    req.add_field 'Content-Type' , 'application/json'

    req.body = {
        customer_phone: number
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.sms_info json
        return obj

      #return res.body
      else
        raise 'Error al enviar el mensaje SMS'
    end
  end


  # @param [String] url
  # @return [Webhook]
  def create_webhook(url)
    Validations.validate_gateway @client

    uri = URI("#{@client.get_uri}webhooks/stores")
    req = Net::HTTP::Post.new uri

    req.basic_auth @client.get_user , @client.get_pass

    req.add_field('Content-Type', 'application/json')

    req.body = {
        url: url
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.webhook json
        return obj

        #return res.body
      else
        error = JSON.parse res.body
        raise "Error al crear el webhook - #{error['message']}"
    end
  end


  # @return [Array]
  def list_webhooks
    Validations.validate_gateway @client

    uri = URI "#{@client.get_uri}webhooks/stores"
    req = Net::HTTP::Get.new uri

    req.basic_auth @client.get_user , @client.get_pass

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.list_webhooks json
        return obj

        # return res.body
      else
        error = JSON.parse res.body
        raise "Error al listar los Webhooks - #{error['message']}"
    end
  end


  # @param [String] url
  # @param [String] id
  # @return [Webhook]
  def update_webhook(id, url)
    Validations.validate_gateway @client

    uri = URI "#{@client.get_uri}webhooks/stores/#{id}"
    req = Net::HTTP::Put.new uri

    req.basic_auth @client.get_user , @client.get_pass

    req.add_field('Content-Type', 'application/json')

    req.body = {
        url: url
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.webhook json
        return obj

        # return res.body
      else
        error = JSON.parse res.body
        raise "Error al actualizar el Webhook - #{error['message']}"
    end
  end


  # @param [String] id
  # @return [Webhook]
  def delete_webhook(id)
    Validations.validate_gateway @client

    uri = URI "#{@client.get_uri}webhooks/stores/#{id}"
    req = Net::HTTP::Delete.new uri

    req.basic_auth @client.get_user , @client.get_pass

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess
        json = JSON.parse res.body
        obj = Factory.webhook json
        return obj

        # return res.body
      else
        error = JSON.parse res.body
        raise "Error al borrar el Webhook - #{error['message']}"
    end
  end


end
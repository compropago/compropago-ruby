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
  def get_providers(auth = false, limit = 0.0, fetch = false)
    if auth === true
      Validations.validate_gateway @client
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

    json = JSON.parse(res.body)
    obj = Factory.list_providers json

    return obj
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

    puts res.class

    case res
      when Net::HTTPSuccess
        res.body
      else
        raise 'Se produjo un error al generar la orden.'
    end
  end

end
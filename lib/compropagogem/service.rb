class Service

  def initialize(client)
    @client = client
    @headers = {
        :useragent => client.get_contained
    }
  end

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

    print res.body
  end

end
class Validations

  # @param [Client] client
  def self.eval_auth (client)
    uri = URI("#{client.get_uri}users/auth/")

    req = Net::HTTP::Get.new(uri)
    req.basic_auth client.get_user, client.get_pass

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    json = JSON.parse(res.body)
    obj = Factory.eval_auth_info json

    return obj
  end

  # @param [Client] client
  def self.validate_gateway (client)
    client_mode = client.get_mode
    auth_info = self.eval_auth client

    if auth_info.mode_key != auth_info.livemode
      raise 'Las llaves no corresponden al modo de la tienda.'
    end

    if client_mode != auth_info.livemode
      raise 'El modo del cliente no corresponde al de la tienda'
    end

    if client_mode != auth_info.mode_key
      raise 'El modo del cliente no corresponde al de las llaves'
    end

    return true
  end

end
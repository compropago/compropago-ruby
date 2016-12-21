class Validations

  def self.eval_auth(client)
    response = Request::get(client.deploy_uri+'users/auth/', user: client.get_user, pass: client.get_pass)
    info = Factory.get_instance_of('EvalAuthInfo', response)

    if info.code == 200
      return info
    else
      raise 'Error :'+info.message
    end
  end

  def self.validate_gateway(client)
    unless client
      raise 'Client object is not valid'
    end

    client_mode = client.live

    auth_info = Validations::eval_auth client

    if auth_info.mode_key != auth_info.livemode
      raise 'Keys are diferent of store mode.'
    end

    if client_mode != auth_info.livemode
      raise 'Client mode is diferent of store mode'
    end

    if client_mode != auth_info.mode_key
      raise 'Client mode is diferent of keys mode'
    end
  end

end
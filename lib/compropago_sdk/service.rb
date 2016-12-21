class Service

  def initialize(client)
    @client = client
  end

  def list_providers(auth=false, limit=0)
    if auth
      Validations::validate_gateway @client
      uri = @client.deploy_uri+'providers/'
      keys = {user: @client.get_user, pass: @client.get_pass}
    else
      uri = @client.deploy_uri+'providers/true/'
      keys = nil
    end

    if limit > 0
      uri = uri+'?order_total='+limit.to_s
    end

    response = Request::get(uri, keys)

    Factory::get_instance_of('ListProviders', response)
  end

  

end
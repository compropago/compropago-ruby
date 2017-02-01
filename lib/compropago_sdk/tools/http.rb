class Http

  def initialize(url)
    @url = url
    @data = nil
    @auth = nil
    @method = nil
    @extra_headers = nil
  end

  def set_method(method)
    if method == 'GET' || method == 'POST' || method == 'PUT' || method == 'DELETE'
      @method = method
    else
      raise 'Not supported method'
    end
  end

  def set_auth(auth)
    @auth = auth
  end

  def set_data(data)
    @data = data.to_json
  end

  def set_extra_headers(headers)
    if headers.is_a?(Hash)
      @extra_headers = headers
    end
  end

  def execute_request
    headers = {
        'content-type' => 'application/json',
        'cache-control' => 'no-cache'
    }

    if @extra_headers
      headers.merge @extra_headers
    end

    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    case @method
      when 'GET'
        req = Net::HTTP::Get.new(uri.request_uri, headers)
      when 'POST'
        req = Net::HTTP::Post.new(uri.request_uri, headers)
      when 'PUT'
        req = Net::HTTP::Put.new(uri.request_uri, headers)
      when 'DELETE'
        req = Net::HTTP::Delete.new(uri.request_uri, headers)
      else
        raise 'Request method is not defined: '+@method.to_s
    end

    if @auth && @auth.is_a?(Hash)
      req.basic_auth @auth[:user], @auth[:pass]
    end

    req.body = @data

    res = http.request(req)

    res.body
  end

end
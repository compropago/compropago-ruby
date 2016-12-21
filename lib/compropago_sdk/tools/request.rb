class Request

  def self.validate_response(res)
    if res
      aux = JSON.parse(res)

      if aux.is_a?(Hash) && aux['type'] == 'error'
        raise 'Error: '+aux['message']
      else
        return true
      end
    else
      raise 'Empty Response'
    end
  end

  def self.get(url, auth=nil, headers=nil)
    http = Http.new url
    http.set_auth auth
    http.set_method 'GET'
    http.set_extra_headers headers

    response = http.execute_request

    Request::validate_response response

    return response
  end

  def self.post(url, data=nil, auth=nil, headers=nil)
    http = Http.new url
    http.set_auth auth
    http.set_method 'POST'
    http.set_data data
    http.set_extra_headers headers

    response = http.execute_request

    Request::validate_response response

    return response
  end

  def self.put(url, data=nil, auth=nil, headers=nil)
    http = Http.new url
    http.set_auth auth
    http.set_method 'PUT'
    http.set_data data
    http.set_extra_headers headers

    response = http.execute_request

    Request::validate_response response

    return response
  end

  def self.delete(url, data=nil, auth=nil, headers=nil)
    http = Http.new url
    http.set_auth auth
    http.set_method 'DELETE'
    http.set_data data
    http.set_extra_headers headers

    response = http.execute_request

    Request::validate_response response

    return response
  end

end
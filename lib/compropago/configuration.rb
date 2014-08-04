module Compropago
  # Stores runtime configuration information.
  #
  # @example Standard settings
  #  Compropago.api_url = "https://api.compropago.com/v2"
  #  Compropago.api_key = "MyToken"aa
  ActiveRestClient::Base.base_url = "https://api.compropago.com/v1"
  ActiveRestClient::Base.adapter = Faraday.default_adapter

  def self.api_key
    @api_key
  end

  def self.api_url
    ActiveRestClient::Base.base_url
  end

  def self.api_key=(api_key)
    @api_key = api_key
    ActiveRestClient::Base.faraday_config do |faraday|
      faraday.request  :basic_auth, api_key, nil
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.response :raise_error
      #
      #FIXME https://github.com/lostisland/faraday/wiki/Setting-up-SSL-certificates#solutions-to-avoid
      faraday.ssl.merge!({ verify: false })
    end
  end

  def self.api_url=(api_url)
    ActiveRestClient::Base.base_url = api_url
  end
end

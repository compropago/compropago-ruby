module Compropago
  # Stores runtime configuration information.
  #
  # @example Standard settings
  #  Compropago.api_url = "https://api.compropago.com/v2"
  #  Compropago.api_key = "MyToken"
  @api_url = "https://api.compropago.com/v1"

  def self.api_key
    @api_key
  end

  def self.api_url
    @api_url
  end

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_url=(api_url)
    @api_url = api_url
  end
end

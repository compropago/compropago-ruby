module Compropago
  # Stores runtime configuration information.
  #
  # @example Standard settings
  #     Compropago.configure do |config|
  #     end
  #
  # @see Compropago.configure
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    self.configuration.api_url ||= "https://api.compropago.com/v1"
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :api_url
  end
end

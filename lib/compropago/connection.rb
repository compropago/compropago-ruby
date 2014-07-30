require "uri"
require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{ |f| require f }
module Compropago
  module Connection

    def api_connection
      @api_connection = Faraday.new(:url => Compropago.configuration.api_url) do |faraday|
        faraday.request  :basic_authentication, Compropago.configuration.api_key
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.response :raise_error
        #faraday.use FaradayMiddleware::RaiseHttpException
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end
end

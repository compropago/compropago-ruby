# API spec at http://compropago.com/documentacion/api
# Version
require 'compropago/version'
require "active_rest_client"
require "compropago/configuration"

module Compropago
  autoload :Base, 'compropago/base'
  autoload :Charge, 'compropago/charge'
end

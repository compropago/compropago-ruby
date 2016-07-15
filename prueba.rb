#!/usr/bin/env ruby

require './lib/compropago'

client = Client.new(
    'pk_test_5989d8209974e2d62',
    'sk_test_6ff4e982253c44c42',
    false
)

puts client.get_uri

begin

  Validations.eval_auth client

  puts Validations.validate_gateway client

  providers = client.api.get_providers false , 15000 , true

  for provider in providers
    puts provider.name
  end

  order = PlaceOrderInfo.new(
    '12',
    'M4 Style Ruby',
    123.45,
    'Eduardo Aguilar',
    'eduardo.aguilar@compropago.com',
    'OXXO',
    nil,
    'rubygem',
    '2.0.0'
  )

  puts client.api.place_order order


rescue Exception => e

  puts "Error: #{e.message}"

end
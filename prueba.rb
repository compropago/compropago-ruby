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

  puts client.api.get_providers false , 15000 , true

rescue Exception => e

  puts "Error: #{e.message}"

end
#!/usr/bin/env ruby

require './lib/compropago'

client = Client.new(
    'pk_test_5989d8209974e2d62',
    'sk_test_6ff4e982253c44c42',
    false
)

begin

  Validations.eval_auth client

  puts Validations.validate_gateway client

  puts '#####################'
  puts '#####################'

  providers = client.api.list_providers false , 15000 , true

  puts providers

  puts '#####################'
  puts '#####################'

  order = PlaceOrderInfo.new(
    '123',
    'M4 Style Ruby',
    1000,
    'Eduardo Aguilar',
    'eduardo.aguilar@compropago.com',
    'OXXO',
    nil,
    'rubygem',
    '2.0.0'
  )

  new_order = client.api.place_order order

  puts new_order


  puts '#####################'
  puts '#####################'

  sms_info = client.api.send_sms_instructions '5554781015' , new_order.get_id

  puts sms_info
  puts sms_info.get_type

  puts '#####################'
  puts '#####################'

  webhook = client.api.create_webhook('http://asd.com')

  puts webhook

  puts '#####################'
  puts '#####################'

  puts client.api.update_webhook webhook.id , 'http://pruesba.com'

  puts '#####################'
  puts '#####################'

  puts client.api.list_webhooks

  puts '#####################'
  puts '#####################'

  puts client.api.delete_webhook webhook.id

  puts '#####################'
  puts '#####################'

  puts client.api.verify_order new_order.get_id

  puts '#####################'
  puts '#####################'



rescue => e

  puts e.backtrace
  raise

end
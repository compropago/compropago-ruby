require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:unit) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/unit_test.rb']
end

Rake::TestTask.new(:contract) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/contract/**/*_test.rb']
end

Rake::TestTask.new(:full) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :ipaddress do
  require 'compropago_sdk'

  order_info = {
    :order_id => 12,
    :order_name => 'M4 php sdk',
    :order_price => 123.45,
    :customer_name => 'Eduardo',
    :customer_email => 'asd@asd.com',
    :payment_type => 'SEVEN_ELEVEN',
    :currency => 'MXN'
  }

  order = Factory::get_instance_of('PlaceOrderInfo', order_info)

  client = Client.new(
    'pk_test_638e8b14112423a086',
    'sk_test_9c95e149614142822f',
    false
  )
  
  neworder = client.api.place_order(order)
end


task :default => :full


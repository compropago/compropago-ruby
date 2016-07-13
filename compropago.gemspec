

Gem::Specification.new do |s|
  s.name         = 'compropago'
  s.version      = '2.0.0'
  s.date         = '2016-07-13'
  s.summary      = 'ComproPago Ruby Gem'
  s.description  = 'Gema que permite el consumo de los servicios del API de ComproPago'
  s.authors      = ['Eduardo Aguilar']
  s.email        = 'eduardo.aguilar@compropago.com'
  s.files        = [
      'lib/compropago.rb',

      'lib/compropagogem/client.rb',
      'lib/compropagogem/service.rb',

      'lib/compropagogem/factory/factory.rb',
      'lib/compropagogem/factory/json/serialize_object.rb',

      'lib/compropagogem/models/eval_auth_info.rb',
      'lib/compropagogem/models/provider.rb',

      'lib/compropagogem/tools/validations.rb'
  ]
  s.homepage     = 'https://github.com/compropago/compropago-ruby'
  s.license      = 'Apache-2.0'
end

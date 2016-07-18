li = []

Dir.glob('./lib/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/factory/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/factory/abs/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/factory/v10/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/factory/v11/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/factory/json/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/models/*.rb').each do |archivo|
  li.push archivo
end

Dir.glob('./lib/compropagogem/tools/*.rb').each do |archivo|
  li.push archivo
end

Gem::Specification.new do |s|
  s.name         = 'compropago'
  s.version      = '2.0.0'
  s.date         = '2016-07-13'
  s.summary      = 'ComproPago Ruby Gem'
  s.description  = 'Gema que permite el consumo de los servicios del API de ComproPago'
  s.authors      = ['Eduardo Aguilar']
  s.email        = 'eduardo.aguilar@compropago.com'
  s.files        = li
  s.homepage     = 'https://github.com/compropago/compropago-ruby'
  s.license      = 'Apache-2.0'
end

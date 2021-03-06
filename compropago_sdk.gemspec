# coding: utf-8

# lista de archivos
li = []

# Carga de archivos al listado (se repite el proceso por nivel de profundidad en la carpeta lib)
Dir.glob('./lib/*.rb').each do |archivo| li.push archivo end
Dir.glob('./lib/compropago_sdk/*.rb').each do |archivo| li.push archivo end
Dir.glob('./lib/compropago_sdk/factory/*.rb').each do |archivo| li.push archivo end
Dir.glob('./lib/compropago_sdk/factory/models/*.rb').each do |archivo| li.push archivo end
Dir.glob('./lib/compropago_sdk/tools/*.rb').each do |archivo| li.push archivo end

Gem::Specification.new do |spec|
  spec.name          = 'compropago_sdk'
  spec.version       = '4.0.0.1'
  spec.authors       = ['Eduardo Aguilar','Christian Aguirre']
  spec.email         = ['eduardo.aguilar@compropago.com','christian@compropago.com']
  spec.summary       = %q{Gema para API ComproPago}
  spec.description   = %q{Provee los servicios de creacion de cargos, verificacion, etc.}
  spec.homepage      = 'https://github.com/compropago/compropago-ruby'
  spec.license       = 'MIT'

  # Inclucion del listado de archivos de la gema
  spec.files         = li

  # Dependencias en desarrollo descargables de rubygems.org
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_dependency 'easy_request'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'compropago/version'

Gem::Specification.new do |spec|
  spec.name          = "compropago"
  spec.version       = Compropago::VERSION
  spec.authors       = ["Jose Gabriel"]
  spec.email         = ["soporte@compropago.com"]
  spec.description   = %q{Ruby gem for making calls to ComproPago API}
  spec.summary       = %q{Ruby bindings for ComproPago}
  spec.homepage      = "http://compropago.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

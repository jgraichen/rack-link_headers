# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack/link_headers/version'

Gem::Specification.new do |gem|
  gem.name          = 'rack-link_headers'
  gem.version       = Rack::LinkHeaders::VERSION
  gem.authors       = ["Jan Graichen"]
  gem.email         = ["jg@altimos.de"]
  gem.description   = %q{Easy Link header management for rack responses.}
  gem.summary       = %q{Easy Link header management for rack responses.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rack'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
end

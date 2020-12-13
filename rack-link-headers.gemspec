# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack/link_headers/version'

Gem::Specification.new do |gem|
  gem.name          = 'rack-link_headers'
  gem.version       = Rack::LinkHeaders::VERSION
  gem.authors       = ['Jan Graichen']
  gem.email         = ['jg@altimos.de']
  gem.description   = 'Easy Link header management for rack responses.'
  gem.summary       = 'Easy Link header management for rack responses.'
  gem.homepage      = ''
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map {|f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'rack'

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
end

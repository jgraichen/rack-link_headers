# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack/link_headers/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-link_headers'
  spec.version       = Rack::LinkHeaders::VERSION
  spec.authors       = ['Jan Graichen']
  spec.email         = ['jgraichen@altimos.de']
  spec.summary       = 'Easy Link header management for rack responses.'
  spec.homepage      = 'https://github.com/jgraichen/rack-link_headers'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.7.0'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['**/*'].grep(%r{^(
    (bin|lib|test|spec|features)/|
    (.*\.gemspec|.*LICENSE.*|.*README.*|.*CHANGELOG.*)
  )}x)

  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack'
end

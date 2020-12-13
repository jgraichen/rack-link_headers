# frozen_string_literal: true

require 'rack'

module Rack
  module LinkHeaders
    # Helper for easy adding link headers to rack responses.
    module Helper
      def self.included(base)
        base.send :include, InstanceMethods
      end

      module InstanceMethods
        # Add a new Link header to response headers. Requires
        # a URL and a params hash. Does not escape or
        # sanitize anything. Manual added Link headers will be
        # overridden.
        def link(url, params = {})
          links << {url: url.to_s, params: params}

          self['Link'] = links.to_a.map do |link|
            "<#{link[:url]}>" + link[:params].keys.sort.map do |k|
              "; #{k}=\"#{link[:params][k]}\""
            end.join
          end.join(', ')
        end

        def links
          @links ||= []
        end
      end
    end
  end
end

Rack::Response.include Rack::LinkHeaders::Helper
Rack::Response::Helpers.include Rack::LinkHeaders::Helper

if defined?(ActionDispatch::Response)
  ActionDispatch::Response.include Rack::LinkHeaders::Helper
end
if defined?(ActionController::TestResponse)
  ActionController::TestResponse.include Rack::LinkHeaders::Helper
end

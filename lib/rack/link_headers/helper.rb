require 'rack/response'

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
          links << {:url => url.to_s, :params => params}

          self["Link"] = links.to_a.map do |link|
            "<#{link[:url]}>" + link[:params].to_a.map do |k, v|
              "; #{k}=\"#{v}\""
            end.join
          end.join(', ')
        end

        def links
          @__links ||= []
        end
      end
    end
  end
end

Rack::Response.send :include, Rack::LinkHeaders::Helper
Rack::Response::Helpers.send :include, Rack::LinkHeaders::Helper

ActionDispatch::Response.send :include, Rack::LinkHeaders::Helper if defined?(ActionDispatch::Response)
ActionController::TestResponse.send :include, Rack::LinkHeaders::Helper if defined?(ActionController::TestResponse)

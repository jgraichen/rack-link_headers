require 'rack/response'

module Rack
  module LinkHeaders
    # Helper for easy adding link headers to rack responses.
    module HeaderHashHelper
      def self.included(base)
        base.send :include, InstanceMethods
      end

      module InstanceMethods
        # Add a new Link header to response headers. Requires
        # a rel string and a URL. Does not escape or sanitize
        # anything. Manual added Link headers will be
        # overridden.
        def link(rel, url)
          links << {:rel => rel.to_s, :url => url.to_s }
          self["Link"] = links.to_a.map{|link| "<#{link[:url]}> rel=\"#{link[:rel]}\""}.join(', ')
        end

        def links
          @__links ||= []
        end
      end
    end
  end
end

Rack::Response.send :include, Rack::LinkHeaders::HeaderHashHelper
Rack::Response::Helpers.send :include, Rack::LinkHeaders::HeaderHashHelper

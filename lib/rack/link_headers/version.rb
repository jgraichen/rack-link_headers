# frozen_string_literal: true

module Rack
  module LinkHeaders
    module VERSION
      MAJOR = 2
      MINOR = 4
      PATCH = 0
      STAGE = nil

      def self.to_s
        [MAJOR, MINOR, PATCH, STAGE].compact.join '.'
      end
    end
  end
end

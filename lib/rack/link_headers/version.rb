# frozen_string_literal: true

module Rack
  module LinkHeaders
    module VERSION
      MAJOR = 2
      MINOR = 2
      PATCH = 2
      STAGE = nil

      def self.to_s
        [MAJOR, MINOR, PATCH, STAGE].reject(&:nil?).join '.'
      end
    end
  end
end

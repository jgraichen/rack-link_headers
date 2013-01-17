module Rack
  module LinkHeaders
    module VERSION
      MAJOR = 1
      MINOR = 0
      PATCH = 0
      STAGE = nil

      def self.to_s
        [MAJOR, MINOR, PATCH, STAGE].reject(&:nil?).join '.'
      end
    end
  end
end

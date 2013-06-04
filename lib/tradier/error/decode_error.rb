require 'tradier/error'

module Tradier
  class Error
    # Raised when JSON parsing fails
    class DecodeError < Tradier::Error
    end
  end
end

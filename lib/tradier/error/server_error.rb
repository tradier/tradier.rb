require 'tradier/error'

module Tradier
  class Error
    # Raised when Tradier returns a 5xx HTTP status code
    class ServerError < Tradier::Error
      MESSAGE = "Server Error"

      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [Tradier::Error]
      def self.from_response(response={})
        new(response[:body], response[:response_headers])
      end

      # Initializes a new ServerError object
      #
      # @param message [String]
      # @param response_headers [Hash]
      # @return [Tradier::Error::ServerError]
      def initialize(message=nil, response_headers={})
        super((message || self.class.const_get(:MESSAGE)), response_headers)
      end

    end
  end
end

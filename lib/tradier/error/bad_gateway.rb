require 'tradier/error/server_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 502
    class BadGateway < Tradier::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "Tradier is down or being upgraded."
    end
  end
end

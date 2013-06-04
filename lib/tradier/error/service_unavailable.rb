require 'tradier/error/server_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 503
    class ServiceUnavailable < Tradier::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "Tradier is over capacity."
    end
  end
end

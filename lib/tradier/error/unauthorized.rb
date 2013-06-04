require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 401
    class Unauthorized < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 401
    end
  end
end

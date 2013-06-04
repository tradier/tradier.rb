require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 400
    class BadRequest < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end

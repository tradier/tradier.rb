require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 404
    class UnprocessableEntity < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 422
    end
  end
end

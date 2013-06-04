require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 403
    class Forbidden < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end

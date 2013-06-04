require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 406
    class NotAcceptable < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end

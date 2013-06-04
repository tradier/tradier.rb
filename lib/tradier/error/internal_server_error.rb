require 'tradier/error/server_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 500
    class InternalServerError < Tradier::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end

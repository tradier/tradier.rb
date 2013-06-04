require 'tradier/error/server_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 504
    class GatewayTimeout < Tradier::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The Tradier servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end

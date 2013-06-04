require 'tradier/error/client_error'

module Tradier
  class Error
    # Raised when Tradier returns the HTTP status code 429
    class TooManyRequests < Tradier::Error::ClientError
      HTTP_STATUS_CODE = 429
    end
    EnhanceYourCalm = TooManyRequests
    RateLimited = TooManyRequests
  end
end

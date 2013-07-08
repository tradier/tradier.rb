require 'tradier/base'

module Tradier
  class Calendar < Tradier::Base

    def month
      @_month ||= @attrs[:calendar][:days][:month]
    end

    def year
      @_year ||= @attrs[:calendar][:days][:year]
    end

  end
end

require 'tradier/base'

module Tradier
  class Balance < Tradier::Base

    attr_reader :account_number, :account_type, :cash_available, \
    :cash_margin_value, :dividend_balance, :equity_value, :long_liquid_value, \
    :long_market_value, :market_value, :net_value, :option_requirement, \
    :prev_cash_available, :prev_maintenance_call, :short_liquid_value, \
    :short_market_value, :sweep, :accumFedAmt, :accumFedPrev, :bopmvEqty, \
    :cashMgnCashAv, :optnAddtlReqAmt, :currType

    def self.from_response(body={})
      new(body[:balances] || body)
    end
  end
end

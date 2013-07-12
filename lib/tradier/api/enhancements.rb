require 'tradier/api/utils'
require 'tradier/symbol'
require 'tradier/core_ext/enumerable'

module Tradier
  module API
    module Enhancements
      include Tradier::API::Utils

      def combined_quote(symbols, options={})
        symbols        = symbols.pmap { |s| Tradier::Symbol.parse(s) }
        option_symbols = symbols.select { |s| s.option? }
        equity_symbols = symbols.select { |s| s.equity? }
        option_symbols.map! { |s| s.to_s }
        equity_symbols.map! { |s| s.to_s }

        requests = []
        requests << Celluloid::Future.new { quotes(equity_symbols) }        unless equity_symbols.empty?
        requests << Celluloid::Future.new { option_quotes(option_symbols) } unless option_symbols.empty?
        requests.map { |r| r.value }.flatten
      end

    end
  end
end

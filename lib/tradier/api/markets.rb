require 'tradier/api/utils'

module Tradier
  module API
    module Markets
      include Tradier::API::Utils

      def quotes(symbols, options={})
        options.merge!('symbols' => normalized_symbols(symbols))
        object_from_response(Tradier::API::Utils::Quote, :get, '/markets/quotes', options).body
      end
      alias quote quotes

      def chains(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::OptionQuote, :get, '/markets/options/chains', options).body
      end
      alias chain chains

      def expirations(symbol)
        object_from_response(Tradier::API::Utils::Expiration, :get, '/markets/options/expirations', :symbol => symbol).body
      end

      def strikes(symbol, expiration)
        object_from_response(Tradier::API::Utils::Strike, :get, '/markets/options/strikes', :symbol => symbol, :expiration => expiration).body
      end

      def clock(options={})
        object_from_response(Tradier::Clock, :get, '/markets/clock', options)
      end

      def calendar(options={})
        object_from_response(Tradier::Calendar, :get, '/markets/calendar', options)
      end

      def timesales(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::Timesales, :get, '/markets/timesales', options).body
      end

      def history(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::History, :get, '/markets/history', options).body
      end

      private

      def normalized_symbols(symbols)
        if symbols.is_a? Array
          symbols.map(&:strip).join(',')
        else
          symbols
        end
      end

    end
  end
end

require 'tradier/api/utils'

module Tradier
  module API
    module Markets
      include Tradier::API::Utils

      def quotes(symbols, options={})
        options.merge!('symbols' => normalized_symbols(symbols))
        quote_objects_from_response(Tradier::Quote, :get, '/markets/quotes', options)
      end
      alias quote quotes

      def chains(symbol, options={})
        options.merge!('symbol' => symbol)
        option_quote_objects_from_response(Tradier::OptionQuote, :get, '/markets/options/chains', options)
      end
      alias chain chains

      def expirations(symbol)
        expiration_objects_from_response(Date, :get, '/markets/options/expirations', :symbol => symbol)
      end

      def strikes(symbol)
        strike_objects_from_response(:get, '/markets/options/strikes', :symbol => symbol)
      end

      def clock(options={})
        object_from_response(Tradier::Clock, :get, '/markets/clock', options)
      end

      def calendar(options={})
        object_from_response(Tradier::Calendar, :get, '/markets/calendar', options)
      end

      def timesales(symbol, options={})
        options.merge!('symbol' => symbol)
        timesales_objects_from_response(Tradier::Timesales, :get, '/markets/timesales', options)
      end

      def history(symbol, options={})
        options.merge!('symbol' => symbol)
        history_objects_from_response(Tradier::History, :get, '/markets/history', options)
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

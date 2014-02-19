require 'tradier/api/utils'

module Tradier
  module API
    module Markets
      include Tradier::API::Utils

      # @see https://developer.tradier.com/documentation/markets/get-quotes
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain quotes.
      # @param [String] symbols A comma delimited list of symbols.
      # @return [Array<Tradier::Quote>] An array of expiration dates.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def quotes(symbols, options={})
        options.merge!('symbols' => normalized_symbols(symbols))
        object_from_response(Tradier::API::Utils::Quote, :get, '/markets/quotes', options).body
      end
      alias quote quotes

      # @see https://developer.tradier.com/documentation/markets/get-options-chains
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain an option chain.
      # @param [String] symbol The underlier's symbol.
      # @return [Array<Tradier::OptionQuote>] An array of option quotes.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def chains(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::OptionQuote, :get, '/markets/options/chains', options).body
      end
      alias chain chains

      # @see https://developer.tradier.com/documentation/markets/get-options-expirations
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain an underlier's expiration dates.
      # @param [String] symbol The underlier's symbol.
      # @overload expirations(symbol, options)
      #   @option options [Boolean] :strikes Indicate whether or not to include strikes alongside the expiration dates.
      # @return [Array<Date>] An array of expiration dates when strikes=false.
      # @return [Array<Tradier::Expiration>] An array of <Tradier::Expiration> when strikes=true.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def expirations(symbol, options={})
        options.merge!(:symbol => symbol)
        object_from_response(Tradier::API::Utils::Expiration, :get, '/markets/options/expirations', options).body
      end

      # @see https://developer.tradier.com/documentation/markets/get-options-strikes
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain an underlier's expiration strikes for an expiration date.
      # @param [String] symbol The underlier symbol.
      # @param [String] expiration The expiration date.
      # @return [Array<String>] An array of strike prices.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def strikes(symbol, expiration)
        object_from_response(Tradier::API::Utils::Strike, :get, '/markets/options/strikes', :symbol => symbol, :expiration => expiration).body
      end

      # @see https://developer.tradier.com/documentation/markets/get-clock
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain the market clock
      # @return [Tradier::Clock] A clock.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def clock(options={})
        object_from_response(Tradier::Clock, :get, '/markets/clock', options)
      end

      # @see https://developer.tradier.com/documentation/markets/get-calendar
      # @rate_limited Yes
      # @authentication Requires user context
      # Obtain the market calendar
      # @return [Tradier::Calendar] A calendar.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def calendar(options={})
        object_from_response(Tradier::Calendar, :get, '/markets/calendar', options)
      end

      # @see https://developer.tradier.com/documentation/markets/get-timesales
      # @rate_limited Yes
      # @authentication Requires user context
      # Get time and sales for a given symbol.
      # @param [String] symbol The symbol.
      # @return [Array<Tradier::Timesales>] An array of Time and Sales quotes.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def timesales(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::Timesales, :get, '/markets/timesales', options).body
      end

      # @see https://developer.tradier.com/documentation/markets/get-history
      # @rate_limited Yes
      # @authentication Requires user context
      # Get historical pricing for a given symbol.
      # @param [String] symbol The symbol.
      # @return [Array<Tradier::Event>] An array of historical quotes.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def history(symbol, options={})
        options.merge!('symbol' => symbol)
        object_from_response(Tradier::API::Utils::History, :get, '/markets/history', options).body
      end

      # @see http://developer.tradier.com.dev/documentation/markets/create-events-session
      # @rate_limited Yes
      # @authentication Requires user context
      # Create a streaming session
      # @return [Tradier::EventSession] An event session.
      # @raise [Tradier::Error::Unauthorized] Error raised when supplied user credentials are not valid.
      def markets_session(options={})
        object_from_response(Tradier::EventSession, :post, '/markets/events/session', options)
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

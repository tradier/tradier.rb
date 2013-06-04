require 'tradier/api/utils'

module Tradier
  module API
    module Markets
      include Tradier::API::Utils

      def quotes(symbols, options={})
        quote_objects_from_response(Tradier::Quote, :get, '/markets/quotes', options.merge('symbols' => normalized_symbols(symbols)))
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

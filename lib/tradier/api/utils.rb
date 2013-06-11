require 'tradier/quote'
require 'tradier/option_quote'

module Tradier
  module API
    module Utils

      private

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def quote_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        quote_objects_from_array(klass, response_body[:quotes][:quote])
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def quote_objects_from_array(klass, response)
        if response.is_a?(Array)
          response.map do |element|
            klass.new(element)
          end
        else
          [klass.new(response)]
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def option_quote_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        option_quote_objects_from_array(klass, response_body)
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def option_quote_objects_from_array(klass, response)
        response[:options][:option].map do |element|
          klass.new(element)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def expiration_objects_from_response(klass, request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        date_objects_from_array(klass, response_body[:expirations][:date])
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def date_objects_from_array(klass, response)
        response.map do |element|
          Date.parse(element)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def strike_objects_from_response(request_method, path, options={})
        response_body = send(request_method.to_sym, path, options)[:body]
        response_body[:strikes][:strike]
      end

    end
  end
end

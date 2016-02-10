require 'faraday'
require 'faraday_middleware'
require 'tradier/configurable'
require 'tradier/error/client_error'
require 'tradier/error/server_error'
require 'tradier/response/parse_json'
require 'tradier/response/raise_error'
require 'tradier/version'

module Tradier
  module Default
    ENDPOINT = 'https://api.tradier.com' unless defined? Tradier::Default::ENDPOINT

    VERSION = 'v1' unless defined?(Tradier::Default::VERSION)

    CONNECTION_OPTIONS = {
      :headers => {
        :accept => 'application/json',
        :user_agent => "Tradier Ruby Gem #{Tradier::VERSION}",
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
      }
    } unless defined? Tradier::Default::CONNECTION_OPTIONS

    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      # Convert request params to "www-form-urlencoded"
      builder.use Faraday::Request::UrlEncoded
      # Parse JSON response bodies using MultiJson
      builder.use Tradier::Response::ParseJson
      # # Handle 4xx server responses
      builder.use Tradier::Response::RaiseError, Tradier::Error::ClientError
      # # Handle 5xx server responses
      builder.use Tradier::Response::RaiseError, Tradier::Error::ServerError
      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? Tradier::Default::MIDDLEWARE

    class << self
      # @return [Hash]
      def options
        Hash[Tradier::Configurable.keys.map { |key| [key, send(key)] }]
      end

      # @return [String]
      def access_token
        ENV['TRADIER_ACCESS_TOKEN']
      end

      # @return [String]
      def endpoint
        ENDPOINT
      end

      def version
        VERSION
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::Builder]
      def middleware
        MIDDLEWARE
      end
    end
  end
end

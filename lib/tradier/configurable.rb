require 'forwardable'
require 'tradier/error/configuration_error'

module Tradier
  module Configurable
    extend Forwardable
    attr_writer :access_token
    attr_accessor :endpoint, :connection_options, :middleware, :version
    def_delegator :options, :hash

    class << self

      def keys
        @keys ||= [
          :access_token,
          :endpoint,
          :version,
          :connection_options,
          :middleware
        ]
      end

    end

    # Convenience method to allow configuration options to be set in a block
    #
    # @raise [Tradier::Error::ConfigurationError] Error is raised when supplied
    #   Tradier credentials are not a String or Symbol.
    def configure
      yield self
      validate_credentials!
      self
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def reset!
      Tradier::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Tradier::Default.options[key])
      end
      self
    end
    alias setup reset!

    private

    # @return [Hash]
    def credentials
      { :access_token => @access_token }
    end

    # @return [Hash]
    def options
      Hash[Tradier::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    # Ensures that all credentials set during configuration are of a
    # valid type. Valid types are String and Symbol.
    #
    # @raise [Tradier::Error::ConfigurationError] Error is raised when
    #   supplied Tradier credentials are not a String or Symbol.
    def validate_credentials!
      credentials.each do |credential, value|
        next if value.nil?

        unless value.is_a?(String) || value.is_a?(Symbol)
          raise(Error::ConfigurationError, "Invalid #{credential} specified: #{value} must be a string or symbol.")
        end
      end
    end

  end
end

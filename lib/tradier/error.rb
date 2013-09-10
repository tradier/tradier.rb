module Tradier
  # Custom error class for rescuing from all Tradier errors
  class Error < StandardError
    attr_reader :wrapped_exception

    # @return [Hash]
    def self.errors
      @errors ||= descendants.each_with_object({}) do |klass, hash|
        hash[klass::HTTP_STATUS_CODE] = klass if defined?(klass::HTTP_STATUS_CODE)
        hash.update(klass.errors)
      end
    end

    # @return [Array]
    def self.descendants
      ObjectSpace.each_object(::Class).select{|klass| klass < self}
    end

    # Initializes a new Error object
    #
    # @param exception [Exception, String]
    # @param response_headers [Hash]
    # @return [Tradier::Error]
    def initialize(exception=$!, response_headers={})
      @wrapped_exception = exception
      exception.respond_to?(:backtrace) ? super(exception.message) : super(exception.to_s)
    end

    def backtrace
      @wrapped_exception.respond_to?(:backtrace) ? @wrapped_exception.backtrace : super
    end

  end
end

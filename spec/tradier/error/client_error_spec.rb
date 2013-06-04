require 'spec_helper'

describe Tradier::Error::ClientError do

  before do
    @client = Tradier::Client.new
  end

  Tradier::Error::ClientError.errors.each do |status, exception|
    [nil, "error", "errors"].each do |body|
      context "when HTTP status is #{status} and body is #{body.inspect}" do
        before do
          body_message = '{"' + body + '":"Client Error"}' unless body.nil?
          stub_get("/v1/markets/quotes").with(:query => {:symbols => 'AAPL'}).to_return(:status => status, :body => body_message)
        end
        it "raises #{exception.name}" do
          expect{@client.quotes('AAPL')}.to raise_error exception
        end
      end
    end
  end

end

require 'spec_helper'

describe Tradier::Error::ClientError do

  before do
    @client = Tradier::Client.new
  end

  Tradier::Error::ClientError.errors.each do |status, exception|
    context "when HTTP status is #{status}" do
      before do
        stub_get("/v1/markets/quotes").
          with(:query => {:symbols => 'AAPL'}).
          to_return(:status => status, :body => "Oops! We got a #{exception}")
      end
      it "raises #{exception.name}" do
        expect{@client.quotes('AAPL')}.to raise_error exception
      end
    end
  end

end

require 'spec_helper'

describe Tradier::API::Utils::Expiration do
  it 'returns an empty array when response is null' do
    expirations = Tradier::API::Utils::Expiration.new(:expirations => 'null')
    expect(expirations.body).to be_empty
  end
end

require 'spec_helper'

describe Tradier::Base do

  describe '#attrs' do
    it 'returns a hash of attributes' do
      expect(Tradier::Base.new(:id => 1).attrs).to eq({:id => 1})
    end
  end

end

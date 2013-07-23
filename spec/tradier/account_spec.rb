require 'spec_helper'

describe Tradier::Account do

  describe "#account_number" do
    it "returns the account_number when set" do
      account = Tradier::Account.new(:account_number => '20130704')
      expect(account.account_number).to eq('20130704')
    end
    it "returns nil when account_number is not set" do
      account = Tradier::Account.new({})
      expect(account.account_number).to be_nil
    end
  end

  describe "#type" do
    it "returns the type when set" do
      account = Tradier::Account.new(:type => 'Margin')
      expect(account.type).to eq('Margin')
    end
    it "returns nil when type is not set" do
      account = Tradier::Account.new({})
      expect(account.type).to be_nil
    end
  end

  describe '#margin?' do
    it 'returns true when account type is margin' do
      account = Tradier::Account.new(:type => 'Margin')
      expect(account.margin?).to be_true
    end
  end

  describe '#cash?' do
    it 'returns true when account type is cash' do
      account = Tradier::Account.new(:type => 'Cash')
      expect(account.cash?).to be_true
    end
  end
end

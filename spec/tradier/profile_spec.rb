require 'spec_helper'

describe Tradier::Profile do

  describe "#name" do
    it "returns the name when set" do
      profile = Tradier::Profile.new(:profile => { :name => 'Elaine Benes'})
      expect(profile.name).to eq('Elaine Benes')
    end
    it "returns nil when name is not set" do
      profile = Tradier::Profile.new({})
      expect(profile.name).to be_nil
    end
  end

  describe '#accounts' do
    it "returns the accounts when set" do
      profile = Tradier::Profile.new(:profile => { :account => [{:account_number => '123456789', :type => 'Cash'}] })
      expect(profile.accounts).to be_an Array
      expect(profile.accounts.first).to be_a Tradier::Account
    end
    it "returns nil when accounts is not set" do
      profile = Tradier::Profile.new({})
      expect(profile.accounts).to be_nil
    end
  end

end

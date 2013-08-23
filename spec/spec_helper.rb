# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter '.bundle'
    add_group 'Tradier', 'lib/tradier'
    add_group 'Specs', 'spec'
  end
end

require 'tradier'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_delete(path)
  a_request(:delete, Tradier::Default::ENDPOINT + path)
end

def a_get(path)
  a_request(:get, Tradier::Default::ENDPOINT + path)
end

def a_post(path)
  a_request(:post, Tradier::Default::ENDPOINT + path)
end

def a_put(path)
  a_request(:put, Tradier::Default::ENDPOINT + path)
end

def stub_delete(path)
  stub_request(:delete, Tradier::Default::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Tradier::Default::ENDPOINT + path)
end

def stub_post(path)
  stub_request(:post, Tradier::Default::ENDPOINT + path)
end

def stub_put(path)
  stub_request(:put, Tradier::Default::ENDPOINT + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(File.join(fixture_path,file))
end

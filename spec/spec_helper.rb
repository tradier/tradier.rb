# encoding: utf-8

require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '/spec/'
end

require 'tradier'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => 'coveralls.io')

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

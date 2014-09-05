require 'bundler/setup'
require 'tradier'

Tradier.configure do |config|
  config.endpoint           = 'https://stagingapi.tradier.com'
  config.connection_options = Tradier::Default::CONNECTION_OPTIONS.merge(request: { open_timeout: 10, timeout: 20})
end

client = Tradier::Client.new(access_token: 'TtAaKP1NMksCkiSvNLCXPU5piXpA')
# puts client.positions('15970260').inspect
# puts client.orders('15970260').inspect
# puts client.quotes('MSFT').inspect

puts '*' * 50

# puts client.orders.inspect
# puts client.events('15970260').inspect
# puts client.history('MSFT').inspect

# puts client.history('MSFT').first.date

# puts client.expirations('ZTR').inspect

# puts client.strikes('BOIL', '2013-10-19').inspect

# puts client.balances('15970260').inspect

expirations = client.expirations('AAPL', :strikes => true)

puts expirations.first.date
puts expirations.first.strikes.inspect

puts expirations.first.adjustments.first.type
puts expirations.first.adjustments.first.strikes.inspect

# puts client.delete_watchlist('steve-test')

# puts client.watchlists.inspect

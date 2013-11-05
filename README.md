# Tradier

[![Gem Version](https://badge.fury.io/rb/tradier.png)][gem]
[![Build Status](https://secure.travis-ci.org/tradier/tradier.rb.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/tradier/tradier.rb.png?travis)][gemnasium]
[![Coverage Status](https://coveralls.io/repos/tradier/tradier.rb/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/tradier
[travis]: http://travis-ci.org/tradier/tradier.rb
[gemnasium]: https://gemnasium.com/tradier/tradier.rb
[coveralls]: https://coveralls.io/r/tradier/tradier.rb

Rubygem for interacting with the Tradier API.

## Installation

    gem install tradier

## Usage

Create an instance of a `Tradier::Client`:

    require 'tradier'

    client = Tradier::Client.new(:access_token => 'token')

### Placing Orders

Orders can be placed using the `create_order` method. Here are some basic examples:

Place an equity order:

    client.create_order({
      :account  => '123456789'
      :class    => 'equity',
      :symbol   => 'AAPL',
      :duration => 'day',
      :side     => 'buy',
      :quantity => '100',
      :type     => 'market'
    })

Placing an option order:

    client.create_order({
      :account       => '123456789'
      :class         => 'option',
      :symbol        => 'AAPL',
      :option_symbol => 'AAPL140118C00195000',
      :duration      => 'day',
      :side          => 'buy',
      :quantity      => '100',
      :type          => 'market'
    })


For a complete list of the types of orders accepted, refer to [Tradier's trading API documentation][trading]

[trading]: https://developer.tradier.com/documentation/trading/getting-started

### Interacting with Accounts

Obtain a user's profile/accounts:

    client.profile

#### Balances

Obtain an account's balances:

    client.balance('12345678')

#### Positions

Obtain an account's positions

    client.positions('12345678')

Obtain positions for all of a user's accounts:

    client.positions

#### Orders

Obtain an account's order

    client.orders('12345678')

Obtain order for all of a user's accounts:

    client.orders

### Market Data

To obtain a quote, simply request:

    client.quote('SYMBOL')

Option chains can be requested using a symbol and expiration:

    client.chain('SYMBOL', :expiration => '2013-11-14')


Refer to the complete [documentation][rdoc] for a complete listing of methods and classes.

[rdoc]: http://rdoc.info/gems/tradier

## Contributing

## Copyright

Copyright (c) 2013 Tradier Inc. See [LICENSE](LICENSE.md) for detail.

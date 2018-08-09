# La Wallet

This is a Ruby on Rails e-wallet project (API only).

The response types are sent using the [JSON API](http://jsonapi.org/) format.

## Installation
Required software:
+ Ruby v2.5.1
+ Ruby on Rails v5.2.0

## Usage
+ bundle (To install all the gems)
+ bundle exec rspec (to run unitary tests)
+ rails s (to start the server)

## Models:

| Customers | Wallets        |
|-----------|----------------|
| **id**    | **id**         |
| name      | customer_id    |
| title     | wallet_address |
| gender    | wallet_balance |
| age       | wallet_history |
| country   |                |

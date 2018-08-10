![README Banner](banner.png)

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

| Customer   | Data type | NULL    |
|------------|-----------|---------|
| id         | `integer` | `false` |
| login      | `string`  | `false` |
| name       | `text`    | `false` |
| url        | `string`  | `false` |
| avatar_url | `string`  | `false` |
| provider   | `string`  | `false` |
| email      | `string`  | `true`  |
| location   | `text`    | `true`  |


| Wallet      | Data type | NULL    |
|-------------|-----------|---------|
| id          | `integer` | `false` |
| customer_id | `integer` | `false` |
| address     | `string`  | `false` |
| balance     | `decimal` | `false` |
| alias       | `text`    | `true`  |


| Transaction        | Data type  | NULL    |
|--------------------|------------|---------|
| id                 | `integer`  | `false` |
| wallet_receiver_id | `integer`  | `false` |
| wallet_sender_id   | `integer`  | `false` |
| amount             | `decimal`  | `false` |
| date               | `datetime` | `false` |
| message            | `text`     | `true`  |

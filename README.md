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

| Customer | Data type |
|----------|-----------|
| **id**   | **id**    |
| name     | text      |
| title    | text      |
| gender   | text      |
| age      | integer   |
| country  | text      |
| email    | string    |
| password | string    |

| Wallet      | Data type |
|-------------|-----------|
| **id**      | **id**    |
| customer_id | integer   |
| address     | string    |
| balance     | decimal   |

| Transaction | Data type |
|-------------|-----------|
| **id**      | **id**    |
| wallet_id   | integer   |
| receiver    | string    |
| sender      | string    |
| amount      | decimal   |
| date        | datetime  |
| message     | string    |


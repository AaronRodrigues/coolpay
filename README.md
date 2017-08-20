# CoolPay

[![Build Status](https://travis-ci.org/AaronRodrigues/coolpay.svg?branch=master)](https://github.com/AaronRodrigues/coolpay)[![Coverage Status](https://coveralls.io/repos/github/AaronRodrigues/coolpay/badge.svg?branch=master)](https://coveralls.io/github/AaronRodrigues/coolpay?branch=master)

### Installation

1. Clone this repository by typing the following in the command line.
   ```
   git clone git@github.com:AaronRodrigues/coolpay.git
   ```
2. Install bundler
   ```
   gem install bundler
   ```
3. To install dependencies, type:
   ```
   bundle install
   ```
4. Create a .env file in the root directory
5. Fill it with 
   ```
   USERNAME = username
   API_KEY  = apikey
   ```
### USER STORIES

```
As a User,
So that I can use Coolpay,
I want to login with my credentials.

As a User,
So that I can make a transaction,
I want to able to add a recipient.

As a User,
So that I can make a transaction,
I want to able to transfer money.

As a User,
So that I know whether I made a successful transaction,
I want to able to see the status of my payment.
```
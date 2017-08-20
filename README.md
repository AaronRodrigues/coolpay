# CoolPay

[![Build Status](https://travis-ci.org/AaronRodrigues/coolpay.svg?branch=master)](https://github.com/AaronRodrigues/coolpay)[![Coverage Status](https://coveralls.io/repos/github/AaronRodrigues/coolpay/badge.svg?branch=master)](https://coveralls.io/github/AaronRodrigues/coolpay?branch=master)

### Technologies used
- Ruby 2.4.1
- Rails 5.1.2
- Test framework: RSpec
- VCS: GIT
- HTML/CSS

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
6. To check if tests are passing, in the console type:
   ```
   rspec
   ```
7. In the browser, type
   ```
   localhost:9292
   ```
8. If authorization passes, you will be directed to the transactions page.
9. On the transactions page you can Add Recipients and make transactions.



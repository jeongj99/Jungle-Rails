# Jungle

A mini e-commerce application built with Rails 6.1. In this application, one can register/login to their account. Once in their account, they can add plants to their cart and then checkout using their (fake) credit card.

## GIF
!["Registering"](https://github.com/jeongj99/Jungle-Rails/blob/main/docs/register.gif?raw=true)
!["Adding products to cart"](https://github.com/jeongj99/Jungle-Rails/blob/main/docs/add_to_cart.gif?raw=true)
!["Checking out"](https://github.com/jeongj99/Jungle-Rails/blob/main/docs/checkout.gif?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1.5.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Puma 5.0
- Sass-rails >= 6
- Webpacker 5.0
- Turbolinks 5
- JBuilder 2.7
- JQuery-Rails
- Sdoc
- Bcrypt 3.1.7
- Bootstrap 5.0.1
- Font-awesome-rails
- Money-rails
- Rmagick
- Faker
- Carrierwave
- Bootsnap >= 1.4.4
- Tzinfo-data

## Test Dependencies

- Byebug
- Dotenv-rails
- Rspec-rails 5.1
- Net-smtp
- Cypress-rails
- Database_cleaner-active_record
- Capybara >= 3.26
- Selenium-webdriver
- Webdrivers

## Development Dependencies

- Byebug
- Dotenv-rails
- Rspec-rails 5.1
- Net-smtp
- Cypress-rails
- Database_cleaner-active_record
- Web-console >= 4.1.0
- Rack-mini-profiler 2.0
- Listen 3.3
- Spring
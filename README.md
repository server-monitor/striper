# Demo for integrating [Stripe](https://stripe.com/) with Rails

How to run locally:

1. Clone this repo.

2. `cd striper`

3. `bundle install`

4. Create a [Stripe](https://stripe.com/) account.

5. Get your [API keys](https://dashboard.stripe.com/account/apikeys)

6. Enter your keys in `config/application.yml`. For example:

    PUBLISHABLE_KEY: pk_test_abcdefgh
    SECRET_KEY: sk_test_abcdefgh

7. `rails s`

8. Navigate your browser to [localhost:3000](http://localhost:3000)

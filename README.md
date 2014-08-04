# Compropago

This gem helps you integrate ComproPago's API to your ruby app.

## Installation

Add this line to your application's Gemfile:

    gem 'compropago', '~> 0.0.2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install compropago

## Usage

### Authentication

We encourage you to set your API keys in an environment variable rather than hardcoding your API keys.

     Compropago.api_key = "sk_test_my_api_key"

Once you have created an instance of compropago, you can call the methods described in the <a href="http://compropago.com/documentacion/api">api reference</a> on it.


## Examples

### Create a charge

Creating a charge using only the required params <code>product_price</code>, <code>product_name</code>, <code>customer_name</code>, <code>customer_email</code>, <code>payment_type</code>.

```ruby
 Compropago::Charge.create({ product_price: 10000.0,
                             product_name: "SAMSUNG GOLD CURL",
                             product_id: "SMGCURL1",
                             image_url: "https://test.amazon.com/5f4373",
                             customer_name: "Roberto Miranda",
                             customer_email: "roberto@golazzos.com",
                             payment_type: "OXXO"})
```

### Verify a charge

Verify a charge previously made.

```ruby
Compropago::Charge.find("818f2e81-226a-4ff9-88a2-81a577aec380")
```

### SMS payment instructions

Send payment instructions over SMS.

```ruby
Compropago::SMS.create(payment_id: "818f2e81-226a-4ff9-88a2-81a577aec380", customer_phone: "2221515805", customer_company_phone: "TELCEL")
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

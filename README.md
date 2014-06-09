# Compropago

This gem helps you integrate ComproPago's API to your ruby app.

## Installation

Add this line to your application's Gemfile:

    gem 'compropago'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install compropago

## Usage

### Authentication

We encourage you to set your API keys in an environment variable instead of hardcoding your API keys.

    compropago = Compropago::Client.new(ENV['COMPROPAGO_API_KEY'])

Once you have created an instance, you can call the methods described in the <a href="http://compropago.com/documentacion/api">api reference</a> on it.


## Examples

### Create a charge

Creating a charge using only the required params <code>product_price</code>, <code>product_name</code>, <code>customer_name</code>, <code>customer_email</code>, <code>payment_type</code>.
	
	# create_charge product_price, product_name, customer_name, customer_email, payment_type

    compropago.create_charge 3150.0, 'iphone5s', 'Irma Sanz', 'no-replay@compropago.com', 'OXXO'

Adding the optional params <code>product_id</code> and <code>image_url</code> to the request:

    # create_charge product_price, product_name, customer_name, customer_email, payment_type, product_id, image_url

    compropago.create_charge 3150.0, 'iphone5s', 'Irma Sanz', 'no-replay@email.com', 'OXXO', '5ku8g', 'image.jpg'

### Verify a charge

Verify a charge previously made.

	# verify_charge payment_id

    compropago.verify_charge 'b75076ac-a94b-478a-945c-c2caf85be668'

### SMS payment instructions

Send payment instructions over SMS.

	# send_payment_instructions payment_id, customer_phone, customer_company_phone

    compropago.verify_charge 'b75076ac-a94b-478a-945c-c2caf85be668', '2221515805', 'TELCEL'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

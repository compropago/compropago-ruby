class PlaceOrderInfo

  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :customer_name
  attr_accessor :customer_email
  attr_accessor :payment_type
  attr_accessor :currency
  attr_accessor :image_url
  attr_accessor :app_client_name
  attr_accessor :app_client_version

  def initialize(
    order_id,
    order_name,
    order_price,
    customer_name,
    customer_email,
    payment_type='OXXO',
    currency='MXN',
    image_url='',
    app_client_name='sdk-ruby',
    app_client_version=CpConfigSdk::VERSION
  )
    @order_id = order_id
    @order_name = order_name
    @order_price = order_price
    @customer_name = customer_name
    @customer_email = customer_email
    @payment_type = payment_type
    @currency = currency
    @image_url = image_url
    @app_client_name = app_client_name
    @app_client_version = app_client_version
  end

end
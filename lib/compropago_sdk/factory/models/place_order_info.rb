class PlaceOrderInfo

  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :customer_name
  attr_accessor :customer_email
  attr_accessor :payment_type
  attr_accessor :currency
  attr_accessor :expiration_time
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
    expiration_time=nil,
    image_url='',
    app_client_name='sdk-ruby',
    app_client_version=nil
  )
    @order_id = order_id
    @order_name = order_name
    @order_price = order_price
    @customer_name = customer_name
    @customer_email = customer_email
    @payment_type = payment_type
    @currency = currency
    @expiration_time = expiration_time
    @image_url = image_url
    @app_client_name = app_client_name

    if app_client_version.nil?
      @app_client_version = Client::VERSION
    else
      @app_client_version = app_client_version
    end
  end

end
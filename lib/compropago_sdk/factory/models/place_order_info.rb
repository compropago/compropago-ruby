class PlaceOrderInfo

  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :customer_name
  attr_accessor :customer_email
  attr_accessor :customer_phone
  attr_accessor :payment_type
  attr_accessor :currency
  attr_accessor :expiration_time
  attr_accessor :image_url
  attr_accessor :app_client_name
  attr_accessor :app_client_version
  attr_accessor :latitude
  attr_accessor :longitude
  attr_accessor :cp
  attr_accessor :customer_phone

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
    app_client_version=nil,
    latitude=nil,
    longitude=nil,
    cp=nil,
    customer_phone=nil
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
    @latitude = latitude
    @longitude = longitude
    @cp = cp
    @customer_phone = customer_phone

    if app_client_version.nil?
      @app_client_version = Client::VERSION
    else
      @app_client_version = app_client_version
    end
  end

end
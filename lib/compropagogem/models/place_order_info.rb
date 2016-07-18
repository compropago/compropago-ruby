class PlaceOrderInfo
  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :customer_name
  attr_accessor :customer_email
  attr_accessor :payment_type
  attr_accessor :image_url
  attr_accessor :app_client_name
  attr_accessor :app_client_version


  # @param [String] order_id           - Identificador de la orden
  # @param [String] order_name         - Nombre del producto o productos
  # @param [Float]  order_price        - Monto total del la orden
  # @param [String] customer_name      - Nombre del cliente
  # @param [String] customer_email     - Correo del cliente
  # @param [String] payment_type       - (optional) (default => OXXO) internal_name de un objeto de ti po [Provider]
  # @param [String] image_url          - (optional) direccion url de la imagen del producto
  # @param [String] app_client_name    - (optional) (default => rubygem) plataforma desde la que se envia
  # @param [string] app_client_version - (optional) (default => empty) version de la plataforma
  def initialize(order_id, order_name, order_price, customer_name, customer_email, payment_type = 'OXXO', image_url = nil, app_client_name = 'rubygem', app_client_version = '')
    @order_id = order_id
    @order_name = order_name
    @order_price = order_price
    @customer_name = customer_name
    @customer_email = customer_email
    @payment_type = payment_type
    @image_url = image_url
    @app_client_name = app_client_name
    @app_client_version = app_client_version
  end
end
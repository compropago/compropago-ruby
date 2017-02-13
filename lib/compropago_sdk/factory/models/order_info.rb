class OrderInfo

  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :image_url
  attr_accessor :exchange

  def initialize
    @exchange = Exchange.new
  end
end
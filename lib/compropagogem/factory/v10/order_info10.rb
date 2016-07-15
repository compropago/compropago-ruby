class OrderInfo10 < OrderInfo

  attr_accessor :order_id
  attr_accessor :order_name
  attr_accessor :order_price
  attr_accessor :payment_method
  attr_accessor :store
  attr_accessor :country
  attr_accessor :image_url
  attr_accessor :success_url

  # @return [String]
  def get_order_id
    self.order_id
  end

  # @return [String]
  def get_order_price
    self.order_price
  end

  # @return [String]
  def get_order_name
    self.order_name
  end

  # @return [String]
  def get_payment_method
    self.payment_method
  end

  # @return [String]
  def get_store
    self.store
  end

  # @return [String]
  def get_country
    self.country
  end

  # @return [String]
  def get_image_rul
    self.image_url
  end

  # @return [String]
  def get_success_url
    self.success_url
  end

end
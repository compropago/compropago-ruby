class NewOrderInfo10 < NewOrderInfo

  attr_accessor :payment_id
  attr_accessor :short_payment_id
  attr_accessor :payment_status
  attr_accessor :creation_date
  attr_accessor :expiration_date
  attr_accessor :product_information
  attr_accessor :payment_instructions

  def initialize
    self.product_information = ProductInformation.new
    self.payment_instructions = Instructions10.new
  end

  # @return [String]
  def get_id
    self.payment_id
  end

  # @return [String]
  def get_short_id
    self.short_payment_id
  end

  # @return [String]
  def get_status
    self.payment_status
  end

  # @return [String]
  def get_created
    self.creation_date
  end

  # @return [String]
  def get_expiration_date
    self.expiration_date
  end

  # @return [OrderInfo11]
  def get_order_info
    info = OrderInfo10.new

    info.order_id = self.product_information.product_id
    info.order_name = self.product_information.product_name
    info.order_price = self.product_information.product_price
    info.image_url = self.product_information.image_url

    return info
  end

  # @return [FeeDetails]
  def get_fee_details
    nil
  end

  # @return [Instructions]
  def get_instructions
    self.payment_instructions
  end

end
class NewOrderInfo11 < NewOrderInfo

  attr_accessor :id
  attr_accessor :short_id
  attr_accessor :object
  attr_accessor :status
  attr_accessor :created
  attr_accessor :exp_date
  attr_accessor :live_mode
  attr_accessor :order_info
  attr_accessor :fee_details
  attr_accessor :instructions

  def initialize
    self.order_info = OrderInfo11.new
    self.fee_details = FeeDetails11.new
    self.instructions = Instructions11.new
  end

  # @return [String]
  def get_id
    self.id
  end

  # @return [String]
  def get_short_id
    self.short_id
  end

  # @return [String]
  def get_status
    self.status
  end

  # @return [String]
  def get_created
    self.created
  end

  # @return [String]
  def get_expiration_date
    self.exp_date
  end

  # @return [OrderInfo11]
  def get_order_info
    self.order_info
  end

  # @return [FeeDetails]
  def get_fee_details
    self.fee_details
  end

  # @return [Instructions]
  def get_instructions
    self.instructions
  end
end
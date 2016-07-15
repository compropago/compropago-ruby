class CpOrderInfo11 < CpOrderInfo

  attr_accessor :id
  attr_accessor :type
  attr_accessor :object
  attr_accessor :created
  attr_accessor :paid
  attr_accessor :amount
  attr_accessor :livemode
  attr_accessor :currency
  attr_accessor :refunded
  attr_accessor :fee
  attr_accessor :fee_details
  attr_accessor :order_info
  attr_accessor :customer
  attr_accessor :captured
  attr_accessor :failure_message
  attr_accessor :failure_code
  attr_accessor :amount_refunded
  attr_accessor :description
  attr_accessor :dispute

  def initialize
    self.fee_details = FeeDetails11.new
    self.order_info = OrderInfo11.new
    self.customer = Customer.new
  end

  # @return [String]
  def get_id
    self.id
  end

  # @return [String]
  def get_type
    self.type
  end

  # @return [String]
  def get_created
    self.created
  end

  # @return [Bolean]
  def get_paid
    self.paid
  end

  # @return [String]
  def get_currency
    self.currency
  end

  # @return [Bolean]
  def get_fee
    self.fee
  end

  # @return [FeeDetails]
  def get_fee_details
    self.fee_details
  end

  # @return [OrderInfo11]
  def get_order_info
    self.order_info
  end

  # @return [Customer]
  def get_customer
    self.customer
  end

  # @return [Bolean]
  def get_captured
    self.captured
  end

  # @return [String]
  def get_failure_message
    self.failure_message
  end

  # @return [String]
  def get_failure_code
    self.failure_code
  end

  # @return [Float]
  def get_amount_refunded
    self.amount_refunded
  end

  # @return [String]
  def get_description
    self.description
  end

  # @return [String]
  def get_dispute
    self.dispute
  end

end
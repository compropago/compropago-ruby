class CpOrderInfo

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
    @fee_details = FeeDetails.new
    @order_info = OrderInfo.new
    @customer = Customer.new
  end

end
class NewOrderInfo

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
    @order_info = OrderInfo.new
    @fee_details = FeeDetails.new
    @instructions = Instructions.new
  end

end
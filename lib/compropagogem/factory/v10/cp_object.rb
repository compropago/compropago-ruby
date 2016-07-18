class CpObject

  attr_accessor :id
  attr_accessor :object
  attr_accessor :created_at
  attr_accessor :paid
  attr_accessor :paid
  attr_accessor :amount
  attr_accessor :currency
  attr_accessor :refunded
  attr_accessor :fee
  attr_accessor :fee_details
  attr_accessor :payment_details
  attr_accessor :captured
  attr_accessor :failure_message
  attr_accessor :failure_code
  attr_accessor :amount_refunded
  attr_accessor :description
  attr_accessor :dispute

  def initialize
    self.fee_details = FeeDetails10.new
    self.payment_details = PaymentDetails.new
  end

end
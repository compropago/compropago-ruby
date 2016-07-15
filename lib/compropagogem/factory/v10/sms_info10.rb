class SmsInfo10 < SmsInfo

  attr_accessor :type
  attr_accessor :object
  attr_accessor :payment

  def initialize
    self.payment = SmsPayment.new
  end

  # @return [String]
  def get_type
    self.type
  end

  # @return [String]
  def get_object
    self.object
  end

  # @return [String]
  def get_id
    self.payment.id
  end

  # @return [String]
  def get_short_id
    self.payment.short_id
  end

end
class CpOrderInfo10 < CpOrderInfo

  attr_accessor :type
  attr_accessor :object
  attr_accessor :data


  def initialize
    self.data = Data.new
  end


  # @return [String]
  def get_id
    self.data.object.amount
  end

  # @return [String]
  def get_type
    self.type
  end

  # @return [String]
  def get_created
    self.data.object.created_at
  end

  # @return [Bolean]
  def get_paid
    self.data.object.paid
  end

  # @return [String]
  def get_currency
    self.data.object.currency
  end

  # @return [Bolean]
  def get_fee
    self.data.object.fee
  end

  # @return [FeeDetails]
  def get_fee_details
    self.data.object.fee_details
  end

  # @return [OrderInfo11]
  def get_order_info
    info = OrderInfo10.new

    info.order_id = self.data.object.payment_details.product_id
    info.order_price = self.data.object.payment_details.product_proce
    info.order_name = self.data.object.payment_details.product_name
    info.payment_method = self.data.object.payment_details.object
    info.store = self.data.object.payment_details.store
    info.country = self.data.object.payment_details.country
    info.image_url = self.data.object.payment_details.image_url
    info.success_url = self.data.object.payment_details.success_url

    return info
  end

  # @return [Customer]
  def get_customer
    info = Customer.new

    info.customer_email = self.data.object.payment_details.customer_email
    info.customer_name = self.data.object.payment_details.customer_name
    info.customer_phone = self.data.object.payment_details.customer_phone

    return info
  end

  # @return [Bolean]
  def get_captured
    self.data.object.captured
  end

  # @return [String]
  def get_failure_message
    self.data.object.failure_message
  end

  # @return [String]
  def get_failure_code
    self.data.object.failure_code
  end

  # @return [Float]
  def get_amount_refunded
    self.data.object.amount_refunded
  end

  # @return [String]
  def get_description
    self.data.object.description
  end

  # @return [String]
  def get_disputes
    self.data.object.dispute
  end
end
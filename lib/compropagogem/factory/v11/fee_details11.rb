class FeeDetails11 < FeeDetails

  attr_accessor :amount
  attr_accessor :currency
  attr_accessor :type
  attr_accessor :description
  attr_accessor :application
  attr_accessor :amount_refunded
  attr_accessor :tax

  # @return [String]
  def get_amount
    self.amount
  end

  # @return [String]
  def get_currency
    self.currency
  end

  # @return [String]
  def get_type
    self.type
  end

  # @return [String]
  def get_description
    self.description
  end

  # @return [String]
  def get_application
    self.application
  end

  # @return [String]
  def get_amount_refunded
    self.amount_refunded
  end

  # @return [String]
  def get_tax
    self.tax
  end

end
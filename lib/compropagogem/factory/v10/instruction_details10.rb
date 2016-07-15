class InstructionDetails10 < InstructionDetails

  attr_accessor :payment_amount
  attr_accessor :payment_store
  attr_accessor :bank_account_number
  attr_accessor :bank_name

  # @return [String]
  def get_amount
    self.payment_amount
  end

  # @return [String]
  def get_store
    self.payment_store
  end

  # @return [String]
  def get_bank_account_number
    self.bank_account_number
  end

  # @return [String]
  def get_bank_name
    self.bank_name
  end

end
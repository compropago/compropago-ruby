class InstructionDetails11 < InstructionDetails

  attr_accessor :amount
  attr_accessor :store
  attr_accessor :bank_account_number
  attr_accessor :bank_name

  # @return [String]
  def get_amount
    self.amount
  end

  # @return [String]
  def get_store
    self.store
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
class Instructions11 < Instructions

  attr_accessor :description
  attr_accessor :step1
  attr_accessor :step2
  attr_accessor :step3
  attr_accessor :note_extra_comition
  attr_accessor :note_expiration_date
  attr_accessor :note_confirmation
  attr_accessor :details

  def initialize
    self.details = InstructionDetails11.new
  end

  # @return [String]
  def get_description
    self.description
  end

  # @return [String]
  def get_step1
    self.step1
  end

  # @return [String]
  def get_step2
    self.step2
  end

  # @return [String]
  def get_step3
    self.step3
  end

  # @return [String]
  def get_note_extra_comition
    self.note_extra_comition
  end

  # @return [String]
  def get_note_expiration_date
    self.note_expiration_date
  end

  # @return [String]
  def get_note_confirmation
    self.note_confirmation
  end

  # @return [InstructionDetails]
  def get_details
    self.details
  end

end
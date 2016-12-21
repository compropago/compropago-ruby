class Instructions

  attr_accessor :description
  attr_accessor :step_1
  attr_accessor :step_2
  attr_accessor :step_3
  attr_accessor :note_extra_comition
  attr_accessor :note_expiration_date
  attr_accessor :note_confirmation
  attr_accessor :details

  def initialize
    @details = InstructionDetails.new
  end

end
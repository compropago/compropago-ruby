class SmsData

  attr_accessor :object

  def initialize
    self.object = SmsObject.new
  end

end
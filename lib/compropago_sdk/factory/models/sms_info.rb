class SmsInfo

  attr_accessor :type
  attr_accessor :object
  attr_accessor :data

  def initialize
    @data = SmsData.new
  end

end
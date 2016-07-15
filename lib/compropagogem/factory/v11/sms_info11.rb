class SmsInfo11 < SmsInfo

  attr_accessor :type
  attr_accessor :object
  attr_accessor :data

  def initialize
    self.data = SmsData.new
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
    self.data.object.id
  end

  # @return [String]
  def get_short_id
    self.data.object.short_id
  end

end
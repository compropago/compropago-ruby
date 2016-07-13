class Factory

  # @param [JSON] source
  # @return [EvalAuthInfo]
  def self.eval_auth_info(source)
    obj = EvalAuthInfo.new

    obj.type = source['type']
    obj.livemode = source['livemode']
    obj.mode_key = source['mode_key']
    obj.message = source['message']
    obj.code = source['code']

    return obj
  end

  # @return [Array]
  def self.list_providers(source)

  end

end
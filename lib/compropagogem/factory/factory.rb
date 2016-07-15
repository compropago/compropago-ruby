class Factory

  ####################################################################
  #                            EvalAuthInfo                          #
  ####################################################################



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



  ####################################################################
  #                             Providers                            #
  ####################################################################



  # @param [JSON] source
  # @return [Provider]
  def self.provider(source)
    obj = Provider.new

    obj.name = source['name']
    obj.internal_name = source['internal_name']
    obj.store_image = source['store_image']
    obj.is_active = source['is_active']
    obj.image_small = source['image_small']
    obj.image_large = source['image_large']
    obj.image_medium = source['image_medium']
    obj.transaction_limit = source['transaction_limit']
    obj.rank = source['rank']

    return obj
  end

  # @param [Array] source
  # @return [Array]
  def self.list_providers(source)
    contador = 0
    for provider in source
      source[contador] = self.provider provider
      contador += 1
    end

    return source
  end

end
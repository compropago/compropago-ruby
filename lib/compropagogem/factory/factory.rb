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

  ####################################################################
  #                           CpOrderInfo                            #
  ####################################################################

  # @param [JSON] source
  # @return [CpOrderInfo]
  def self.cp_order_info(source)
    case source['api_version']
      when '1.1'
        return SerializeObject.cp_order_info11 source
      else
        return SerializeObject.cp_order_info10 source
    end
  end

  ####################################################################
  #                              SmsInfo                             #
  ####################################################################

  # @param [JSON] source
  # @return [SmsInfo]
  def self.sms_info(source)
    if source.key? 'payment'
      return SerializeObject.sms_info10 source
    else
      return SerializeObject.sms_info11 source
    end
  end

  ####################################################################
  #                           NewOrderInfo                           #
  ####################################################################

  def self.new_order_info(source)
    case source['api_version']
      when '1.1'
        return SerializeObject.new_order_info11 source
      else
        return SerializeObject.new_order_info10 source
    end
  end

  ####################################################################
  #                             Webhooks                             #
  ####################################################################

  # @param [JSON] source
  # @return [Provider]
  def self.webhook(source)
    obj = Webhook.new

    obj.id = source['id']
    obj.url = source['url']
    obj.mode = source['mode']
    obj.status = source['status']

    return obj
  end

  # @param [Array] source
  # @return [Array]
  def self.list_webhooks(source)
    contador = 0
    for webhook in source
      source[contador] = self.webhook webhook
      contador += 1
    end

    return source
  end

end
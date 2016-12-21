class Factory

  def self.get_instance_of(name, data=nil)
    if data && data.is_a?(String)
      data = JSON.parse data
    elsif data && data.is_a?(Hash)
      data = data
    end

    case name
      when 'CpOrderInfo'
        return Serialize::cp_order_info data
      when 'Customer'
        return Serialize::customer data
      when 'EvalAuthInfo'
        return Serialize::eval_auth_info data
      when 'FeeDetails'
        return Serialize::fee_details data
      when 'InstructionDetails'
        return Serialize::instruction_details data
      when 'Instructions'
        return Serialize::instructions data
      when 'NewOrderInfo'
        return Serialize::new_order_info data
      when 'OrderInfo'
        return Serialize::order_info data
      when 'PlaceOrderInfo'
        return Serialize::place_order_info data
      when 'Provider'
        return Serialize::provider data
      when 'ListProviders'
        aux = []
        data.each do |provider|
          aux.push Serialize::provider(provider)
        end
        return aux
      when 'SmsData'
        return Serialize::sms_data data
      when 'SmsInfo'
        return Serialize::sms_info data
      when 'SmsObject'
        return Serialize::sms_object data
      when 'Webhook'
        return Serialize::webhook data
      when 'ListWebhooks'
        aux = []
        data.each do |webhook|
          aux.push Serialize::webhook(webhook)
        end
      else
        raise 'Object not in factory.'
    end
  end

end
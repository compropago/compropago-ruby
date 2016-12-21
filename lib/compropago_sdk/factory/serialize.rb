class Serialize

  def self.place_order_info(data=nil)
    if data.nil?
      return PlaceOrderInfo.new(nil, nil, nil, nil, nil)
    else
      return PlaceOrderInfo.new(
          data['order_id'],
          data['order_name'],
          data['order_price'],
          data['customer_name'],
          data['cystomer_email'],
          data['payment_type'] ? data['payment_type'] : 'OXXO',
          data['currency'] ? data['currency'] : 'MXN',
          data['image_url'] ? data['image_url'] : '',
          data['app_client_name'] ? data['app_client_name'] : 'sdk-ruby',
          data['app_client_version'] ? data['app_client_version'] : CpConfigSdk::VERSION,
      )
    end
  end

  def self.cp_order_info(data=nil)
    if data.nil?
      return CpOrderInfo.new
    else
      obj = CpOrderInfo.new

      obj.id = data['id']
      obj.type = data['type']
      obj.object = data['object']
      obj.created = data['created']
      obj.paid = data['paid']
      obj.amount = data['amount']
      obj.livemode = data['livemode']
      obj.currency = data['currency']
      obj.refunded = data['refunded']
      obj.fee = data['fee']

      obj.fee_details = Serialize::fee_details(data['fee_details'])
      obj.order_info = Serialize::order_info(data['order_info'])
      obj.customer.customer_name = Serialize::customer(data['customer'])

      obj.captured = data['captured']
      obj.failure_message = data['failure_message']
      obj.failure_code = data['failure_code']
      obj.amount_refunded = data['amount_refunded']
      obj.description = data['description']
      obj.dispute = data['dispute']

      return obj
    end
  end

  def self.customer(data=nil)
    if data.nil?
      Customer.new
    else
      obj = Customer.new

      obj.customer_name = data['customer_name']
      obj.customer_email = data['customer_email']
      obj.customer_phone = data['customer_phone']

      return obj
    end
  end

  def self.eval_auth_info(data=nil)
    if data.nil?
      return EvalAuthInfo.new
    else
      obj = EvalAuthInfo.new

      obj.type = data['type']
      obj.livemode = data['livemode']
      obj.mode_key = data['mode_key']
      obj.message = data['message']
      obj.code = data['code']

      return obj
    end
  end

  def self.fee_details(data=nil)
    if data.nil?
      return FeeDetails.new
    else
      obj = FeeDetails.new

      obj.amount = data['amount'] ? data['amount'] : nil
      obj.currency = data['currency'] ? data['currency'] : nil
      obj.type = data['type'] ? data['type'] : nil
      obj.description = data['description'] ? data['description'] : nil
      obj.application = data['application'] ? data['application'] : nil
      obj.tax_percent = data['tax_percent'] ? data['tax_percent'] : nil
      obj.amount_refunded = data['amount_refunded'] ? data['amount_refunded'] : nil
      obj.tax = data['tax'] ? data['tax'] : nil

      return obj
    end
  end

  def self.instruction_details(data=nil)
    if data.nil?
      return InstructionDetails.new
    else
      obj = InstructionDetails.new

      obj.amount = data['amount'] ? data['amount'] : nil
      obj.store = data['store'] ? data['store'] : nil
      obj.payment_amount = data['payment_amount'] ? data['payment_amount'] : nil
      obj.payment_store = data['payment_store'] ? data['payment_store'] : nil
      obj.bank_account_holder_name = data['bank_account_holder_name'] ? data['bank_account_holder_name'] : nil
      obj.bank_account_number = data['bank_accont_number'] ? data['bank_accont_number'] : nil
      obj.bank_reference = data['bank_reference'] ? data['bank_reference'] : nil
      obj.company_reference_name = data['company_reference_name'] ? data['company_reference_name'] : nil
      obj.company_reference_number = data['company_reference_number'] ? data['company_reference_number'] : nil
      obj.company_bank_number = data['company_bank_number'] ? data['company_bank_number'] : nil
      obj.order_reference_number = data['order_reference_number'] ? data['order_reference_number'] : nil
      obj.bank_name = data['bank_name'] ? data['bank_name'] : nil

      return obj
    end
  end

  def self.instructions(data=nil)
    if data.nil?
      return Instructions.new
    else
      obj = Instructions.new

      obj.description = data['description']
      obj.step_1 = data['step_1']
      obj.step_2 = data['step_2']
      obj.step_3 = data['step_3']
      obj.note_extra_comition = data['note_extra_comition']
      obj.note_expiration_date = data['note_expiration_date']
      obj.note_confirmation = data['note_confirmation']

      obj.details = Serialize::instruction_details(data['details'])

      return obj
    end
  end

  def self.new_order_info(data=nil)
    if data.nil?
      return NewOrderInfo.new
    else
      obj = NewOrderInfo()

      obj.id = data['id']
      obj.short_id = data['short_id']
      obj.object = data['object']
      obj.status = data['status']
      obj.created = data['created']
      obj.exp_date = data['exp_date']
      obj.live_mode = data['live_mode']
      obj.order_info = Serialize::order_info(data['order_info'])
      obj.fee_details = Serialize::fee_details(data['fee_details'])
      obj.instructions = Serialize::instructions(data['instructions'])

      return obj
    end
  end

  def self.order_info(data=nil)
    if data.nil?
      return OrderInfo.new
    else
      obj = OrderInfo.new

      obj.order_id = data['order_id'] ? data['order_id'] : nil
      obj.order_price = data['order_price'] ? data['order_price'] : nil
      obj.order_name = data['order_name'] ? data['order_name'] : nil
      obj.payment_method = data['payment_method'] ? data['payment_method'] : nil
      obj.store = data['store'] ? data['store'] : nil
      obj.country = data['country'] ? data['country'] : nil
      obj.image_url = data['image_url'] ? data['image_url'] : nil
      obj.success_url = data['success_url'] ? data['success_url'] : nil

      return obj
    end
  end

  def self.provider(data=nil)
    if data.nil?
      return Provider.new
    else
      obj = Provider.new

      obj.name = data['name']
      obj.store_image = data['store_image']
      obj.is_active = data['is_active']
      obj.internal_name = data['internal_name']
      obj.image_small = data['image_small']
      obj.image_medium = data['image_medium']
      obj.image_large = data['image_large']
      obj.transaction_limit = data['transaction_limit']
      obj.rank = data['rank']

      return obj
    end
  end

  def self.sms_object(data=nil)
    if data.nil?
      return SmsObject.new
    else
      obj = SmsObject.new

      obj.id = data['id']
      obj.object = data['object']
      obj.short_id = data['short_id']

      return obj
    end
  end

  def self.sms_data(data=nil)
    if data.nil?
      return SmsData.new
    else
      obj = SmsData.new

      obj.object = Serialize::sms_object(data['object'])

      return obj
    end
  end

  def self.sms_info(data=nil)
    if data.nil?
      return SmsInfo.new
    else
      obj = SmsInfo.new

      obj.type = data['type']
      obj.object = data['object']
      obj.data = Serialize::sms_data(data['data'])

      return obj
    end
  end

  def self.webhook(data=nil)
    if data.nil?
      return Webhook.new
    else
      obj = Webhook.new

      obj.id = data['id'] ? data['id'] : nil
      obj.url = data['url'] ? data['url'] : nil
      obj.mode = data['mode'] ? data['mode'] : nil
      obj.status = data['status'] ? data['status'] : nil

      return obj
    end
  end

end
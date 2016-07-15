class SerializeObject

  ####################################################################
  #                            CpOrderInfo                           #
  ####################################################################


  def self.cp_order_info11(source)
    res = CpOrderInfo11.new

    res.id = source['id']
    res.type = source['type']
    res.object = source['object']
    res.created = source['created']
    res.paid = source['paid']
    res.amount = source['amount']
    res.livemode = source['livemode']
    res.currency = source['currency']
    res.refunded = source['refunded']
    res.fee = source['fee']

    res.fee_details.amount = source['fee_details']['amount']
    res.fee_details.currency = source['fee_details']['currency']
    res.fee_details.type = source['fee_details']['type']
    res.fee_details.description = source['fee_details']['description']
    res.fee_details.application = source['fee_details']['application']
    res.fee_details.amount_refunded = source['fee_details']['amount_refunded']
    res.fee_details.tax = source['fee_details']['tax']

    res.order_info.order_id = source['order_info']['order_id']
    res.order_info.order_price = source['order_info']['order_price']
    res.order_info.order_name = source['order_info']['order_name']
    res.order_info.payment_method = source['order_info']['payment_method']
    res.order_info.store = source['order_info']['store']
    res.order_info.country = source['order_info']['country']
    res.order_info.image_url = source['order_info']['image_url']
    res.order_info.success_url = source['order_info']['success_url']

    res.customer.customer_name = source['customer']['customer_name']
    res.customer.customer_email = source['customer']['customer_email']
    res.customer.customer_phone = source['customer']['customer_phone']

    res.captured = source['captured']
    res.failure_message = source['failure_message']
    res.failure_code = source['failure_code']
    res.amount_refunded = source['amount_refunded']
    res.description = source['description']
    res.dispute = source['dispute']

    return res
  end


  def self.cp_order_info10(source)
    res = CpOrderInfo10.new

    res.type = source['type']
    res.object = source['object']

    res.data.object.id = source['data']['object']['id']
    res.data.object.object = source['data']['object']['object']
    res.data.object.created_at = source['data']['object']['created_at']
    res.data.object.paid = source['data']['object']['paid']
    res.data.object.amount = source['data']['object']['amount']
    res.data.object.currency = source['data']['object']['currency']
    res.data.object.refunded = source['data']['object']['refunded']
    res.data.object.fee = source['data']['object']['fee']

    res.data.object.fee_details.amount = source['data']['object']['fee_details']['amount']
    res.data.object.fee_details.currency = source['data']['object']['fee_details']['currency']
    res.data.object.fee_details.type = source['data']['object']['fee_details']['type']
    res.data.object.fee_details.description = source['data']['object']['fee_details']['description']
    res.data.object.fee_details.application = source['data']['object']['fee_details']['application']
    res.data.object.fee_details.amount_refunded = source['data']['object']['fee_details']['amount_refunded']

    res.data.object.payment_details.object = source['data']['object']['payment_details']['object']
    res.data.object.payment_details.store = source['data']['object']['payment_details']['store']
    res.data.object.payment_details.country = source['data']['object']['payment_details']['country']
    res.data.object.payment_details.product_id = source['data']['object']['payment_details']['product_id']
    res.data.object.payment_details.product_price = source['data']['object']['payment_details']['product_price']
    res.data.object.payment_details.product_name = source['data']['object']['payment_details']['product_name']
    res.data.object.payment_details.image_url = source['data']['object']['payment_details']['image_url']
    res.data.object.payment_details.success_url = source['data']['object']['payment_details']['success_url']
    res.data.object.payment_details.customer_name = source['data']['object']['payment_details']['customer_name']
    res.data.object.payment_details.customer_email = source['data']['object']['payment_details']['customer_email']
    res.data.object.payment_details.customer_phone = source['data']['object']['payment_details']['customer_phone']

    res.data.object.captured = source['data']['object']['captured']
    res.data.object.failure_message = source['data']['object']['failure_message']
    res.data.object.failure_code = source['data']['object']['failure_code']
    res.data.object.amount_refunded = source['data']['object']['amount_refunded']
    res.data.object.description = source['data']['object']['description']
    res.data.object.dispute = source['data']['object']['dispute']

    return res
  end


  ####################################################################
  #                            NewOrderInfo                          #
  ####################################################################


  def self.new_order_info10(source)
    res = NewOrderInfo10.new

    res.payment_id = source['payment_id']
    res.short_payment_id = source['short_payment_id']
    res.creation_date = source['creation_date']
    res.expiration_date = source['expiration_date']

    res.product_information.product_id = source['product_information']['product_id']
    res.product_information.product_name = source['product_information']['product_name']
    res.product_information.product_price = source['product_information']['product_price']
    res.product_information.image_url = source['product_information']['image_url']

    res.payment_instructions.description = source['payment_instructions']['description']
    res.payment_instructions.step1 = source['payment_instructions']['step1']
    res.payment_instructions.step2 = source['payment_instructions']['step2']
    res.payment_instructions.step3 = source['payment_instructions']['step3']
    res.payment_instructions.note_extra_comition = source['payment_instructions']['note_extra_comition']
    res.payment_instructions.note_expiration_date = source['payment_instructions']['note_expiration_date']
    res.payment_instructions.note_confirmation = source['payment_instructions']['note_confirmation']

    res.payment_instructions.details.payment_amount = source['payment_instructions']['details']['payment_amount']
    res.payment_instructions.details.payment_store = source['payment_instructions']['details']['payment_store']
    res.payment_instructions.details.bank_account_number = source['payment_instructions']['details']['bank_account_number']
    res.payment_instructions.details.bank_name = source['payment_instructions']['details']['bank_name']

    return res
  end


  def self.new_order_info11(source)
    res = NewOrderInfo11.new

    res.id = source['id']
    res.short_id = source['short_id']
    res.obect = source['object']
    res.status = source['status']
    res.created = source['created']
    res.exp_date = source['exp_date']
    res.live_mode = source['live_mode']

    res.order_info.order_id = source['order_info']['order_id']
    res.order_info.order_name = source['order_info']['order_name']
    res.order_info.order_price = source['order_info']['order_price']
    res.order_info.image_url = source['order_info']['image_url']

    res.fee_details.amount = source['fee_details']['amount']
    res.fee_details.tax = source['fee_details']['tax']
    res.fee_details.currency = source['fee_details']['currency']
    res.fee_details.type = source['fee_details']['type']
    res.fee_details.description = source['fee_details']['description']
    res.fee_details.amount_refunded = source['fee_details']['amount_refunded']

    res.instructions.description = source['instructions']['description']
    res.instructions.step1 = source['instructions']['step1']
    res.instructions.step2 = source['instructions']['step2']
    res.instructions.step3 = source['instructions']['step3']
    res.instructions.note_extra_comition = source['instructions']['note_extra_comition']
    res.instructions.note_expiration_date = source['instructions']['note_expiration_date']
    res.instructions.note_confirmation = source['instructions']['note_confirmation']

    res.instructions.details.amount = source['instructions']['details']['amount']
    res.instructions.details.store = source['instructions']['details']['store']
    res.instructions.details.bank_account_number = source['instructions']['details']['bank_account_number']
    res.instructions.details.bank_name = source['instructions']['details']['bank_name']

    return res
  end


  ####################################################################
  #                              SmsInfo                             #
  ####################################################################


  def self.sms_info10(source)
    res = SmsInfo10.new

    res.type = source['type']
    res.object = source['object']

    res.payment.id = source['payment']['id']
    res.payment.short_id = source['payment']['short_id']

    return res
  end


  def self.sms_info11(source)
    res = SmsInfo11.new

    res.type = source['type']
    res.object = source['object']

    res.data.object.id = source['data']['object']['id']
    res.data.object.short_id = source['data']['object']['short_id']
    res.data.object.object = source['data']['object']['object']

    return res
  end

end
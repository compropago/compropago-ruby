require 'minitest/autorun'

# Importar el archivo principal de la gema (lib/scafold_gem)
require 'compropago_sdk'

class MyTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @publickey = 'pk_test_638e8b14112423a086'
    @privatekey = 'sk_test_9c95e149614142822f'
    @mode = false
    @phone_number = '5561463627'
    @limit = 15000
    @order_info = {
        order_id: 123,
        order_name: 'M4 unit ruby',
        order_price: 123.45,
        customer_name: 'Eduardo Aguilar',
        customer_email: 'aguilar@compropago.com'
    }
  end

  def test_create_client
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      res = true
    rescue => ex
      puts 'Error: '+ex.message
    end

    assert res
  end

  def test_eval_auth
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      evl = Validations::eval_auth obj

      res = evl.is_a? EvalAuthInfo
    rescue => ex
      puts 'Error: '+ex.message
    end

    assert res
  end

  def test_providers
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      providers = obj.api.list_providers

      res = (providers.is_a?(Array) && providers[0].is_a?(Provider))
    rescue => ex
      puts 'Error: '+ex.message
    end

    assert res
  end

  def test_providers_limit
    res = true
    begin
      obj = Client.new @publickey, @privatekey, @mode
      provs = obj.api.list_providers @limit

      provs.each do |prov|
        if prov.transaction_limit < @limit
          res = false
          break
        end
      end
    rescue => ex
      puts 'Error: '+ex.message
      res = false
    end

    assert res
  end

  def test_providers_currency
    res = true
    begin
      obj = Client.new @publickey, @privatekey, @mode
      provs = obj.api.list_providers 700, 'USD'

      provs.each do |prov|
        if prov.transaction_limit < @limit
          res = false
          break
        end
      end
    rescue => ex
      puts 'Error: '+ex.message
      res = false
    end

    assert res
  end

  def test_place_order
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      order = Factory::get_instance_of 'PlaceOrderInfo', @order_info
      response = obj.api.place_order order

      res = response.is_a? NewOrderInfo
    rescue => ex
      puts 'Error: '+ex.message
    end
    assert res
  end

  def test_place_order_expdate
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      time = Time.now.to_i + (6 * 60 * 60)

      @order_info[:expiration_time] = time
      @order_info[:customer_email] = 'asd@asd.com'

      order = Factory::get_instance_of 'PlaceOrderInfo', @order_info
      response = obj.api.place_order order

      res = response.is_a?(NewOrderInfo) && (time == response.exp_date)
    rescue => ex
      puts 'Error: '+ex.message
    end
    assert res
  end

  def test_service_verify_order
    res = false
    begin
      obj   = Client.new @publickey, @privatekey, @mode

      @order_info[:customer_email] = 'qwe@qwe.com'

      order = Factory::get_instance_of 'PlaceOrderInfo', @order_info
      resp  = obj.api.place_order order
      ver   = obj.api.verify_order resp.id

      res = ver.is_a? CpOrderInfo
    rescue => ex
      puts 'Error: '+ex.message
    end

    assert res
  end

  def test_service_send_sms
    res = false
    begin
      obj   = Client.new @publickey, @privatekey, @mode

      @order_info[:customer_email] = 'ert@ert.com'

      order = Factory::get_instance_of 'PlaceOrderInfo', @order_info
      resp  = obj.api.place_order order
      sms   = obj.api.send_sms_instructions @phone_number, resp.id

      res = sms.is_a? SmsInfo
    rescue => ex
      puts 'Error: '+ex.message
    end

    assert res
  end

  def test_list_webhooks
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      list = obj.api.list_webhooks

      res = list.is_a?(Array) && list[0].is_a?(Webhook)
    rescue => ex
      puts ex.message
    end
    assert res
  end

  def test_create_webhook
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      webhook = obj.api.create_webhook 'http://misitio.com/webhook/'

      res = webhook.is_a? Webhook
    rescue => ex
      puts ex.message
    end
    assert res
  end

  def test_update_webhook
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      webhook = obj.api.create_webhook 'http://misitio.com/webhook/'
      webhook = obj.api.update_webhook webhook.id, 'http://misitio.com/webhook/dos'

      res = webhook.is_a? Webhook
    rescue => ex
      puts ex.message
    end
    assert res
  end

  def test_delete_webhook
    res = false
    begin
      obj = Client.new @publickey, @privatekey, @mode
      webhook = obj.api.create_webhook 'http://misitio.com/webhook/dos'
      webhook = obj.api.delete_webhook webhook.id

      res = webhook.is_a? Webhook
    rescue => ex
      puts ex.message
    end
    assert res
  end

end
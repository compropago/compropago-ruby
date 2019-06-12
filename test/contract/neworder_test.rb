require 'minitest/autorun'

# Importar el archivo principal de la gema (lib/compropago_sdk)
require 'compropago_sdk'

class NeworderTest < MiniTest::Unit::TestCase

  def setup
    @client = Client.new('pk_live_760db54141134cbcb0', 'sk_live_6432b0141302941f8b', true)
    @order_info = {
        :order_id => 1232,
        :order_name => 'M4 Contract SDK ruby',
        :order_price => rand(5..5000),
        :customer_name => 'Eduardo Aguilar Y',
        :customer_email => 'eduardo.aguilar@compropago.com',
        :payment_type => 'OXXO'
    }
  end

  def test_main
    res = false
    begin
      order = Factory::get_instance_of('PlaceOrderInfo', @order_info)
      new_order = @client.api.place_order(order)

      validate_order_info(new_order.order_info)

      res = true
    rescue => ex
      puts ex.message
    end

    assert(res)
  end

  private def validate_order_info(order_info)
    if order_info.order_id == '' || order_info.order_id.nil?
      raise 'Error: order_info.order_id == '
    end
    if order_info.order_name == '' || order_info.order_name.nil?
      raise 'Error: order_info.order_name == '
    end
    if order_info.order_price != 0
      raise 'Error: order_info.order_price == '
    end
  end

  private def validate_exchange(exchange)
    unless exchange.origin_amount.is_a? Numeric
      raise 'Error: exchange.origin_amount == '+exchange.origin_amount.class
    end
    if exchange.origin_currency != 'MXN' && exchange.origin_currency != 'USD' && exchange.origin_currency != 'GBP' && exchange.origin_currency != 'EUR'
      raise 'Error: exchange.origin_currency == ' + exchange.origin_currency
    end
    unless exchange.final_amount.is_a? Numeric
      raise 'Error: exchange.final_amount == ' + exchange.final_amount
    end
  end

end
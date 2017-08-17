require 'minitest/autorun'

# Importar el archivo principal de la gema (lib/scafold_gem)
require 'compropago_sdk'

class NeworderTest < MiniTest::Unit::TestCase

  def setup
    @client = Client.new('pk_live_760db54141134cbcb0', 'sk_live_6432b0141302941f8b', true)
    @order_info = {
        :order_id => 1232,
        :order_name => 'M4 Contract SDK ruby',
        :order_price => 123,
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

      # if (new_order.id =~ /^ch_([0-9a-z]*)-([0-9a-z]*)-([0-9a-z]*)-([0-9a-z]*)-([0-9a-z]*)$/) == nil
      #   raise 'Error: id == ' + new_order.id.class
      # end
      # if (new_order.short_id =~ /^[0-9a-z]{6}$/) == nil
      #   raise 'Error: short_id == ' + new_order.short_id.class
      # end
      # unless new_order.type == 'charge.pending'
      #   raise 'Error: type == ' + new_order.type
      # end
      # unless new_order.object == 'charge'
      #   raise 'Error: object == ' + new_order.object.class
      # end
      # unless new_order.created_at.is_a? Numeric
      #   raise 'Error: created_at == ' + new_order.created_at.class
      # end
      # unless new_order.accepted_at.is_a? Numeric
      #   raise 'Error: accepted_at == ' + new_order.accepted_at.class
      # end
      # unless new_order.expires_at.is_a? Numeric
      #   raise 'Error: expires_at == ' + new_order.expires_at.class
      # end
      # unless !!new_order.livemode == new_order.livemode
      #   raise 'Error: livemode == '+new_order.livemode.class
      # end
      # if new_order.api_version != '1.0' && new_order.api_version != '1.1'
      #   raise 'Error: api_version == '+new_order.api_version.class
      # end

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

    #validate_exchange(order_info.exchange)
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
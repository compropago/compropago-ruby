 Compropago.api_key = "sk_test_71863001136936a44"
 Compropago::Charge.find("1")

 Compropago::Charge.create({ product_price: 10000.0,
                             product_name: "SAMSUNG GOLD CURL",
                             product_id: "SMGCURL1",
                             image_url: "https://test.amazon.com/5f4373",
                             customer_name: "Roberto Miranda",
                             customer_email: "roberto@golazzos.com",
                             payment_type: "OXXO"})
 #=>
#<Compropago::Charge:0x007f99abb13220 @attributes={:payment_id=>"818f2e81-226a-4ff9-88a2-81a577aec380", :short_payment_id=>"b05aed", :payment_status=>"PENDING", :creation_date=>Wed, 30 Jul 2014 18:05:49 -0500, :expiration_date=>Thu, 31 Jul 2014 18:05:49 -0500, :product_information=>#<Compropago::Charge:0x007f99abb10d18 @attributes={:product_id=>"SMGCURL1", :product_name=>"SAMSUNG GOLD CURL", :product_price=>"10000.0"}, @dirty_attributes=#<Set: {}>>, :payment_instructions=>#<Compropago::Charge:0x007f99abb103e0 @attributes={:description=>"Para que el pago sea válido debes pagar la cantidad exacta de $10000.0", :step_1=>"Ir a la caja OXXO de 8:00 am a 8:00 pm", :step_2=>"Solicitar depósito bancario al número: Banco de Pruebas 0000 0000 0000 0000", :step_3=>"Deposite la cantidad exacta de: $10000.0", :note_extra_comition=>"Las tiendas Oxxo cobran en caja una comisión de $7.00 por el concepto de recepción de cobranza.", :note_expiration_date=>"Orden válida antes de 31/07/2014, en caso de vencimiento genera una nueva compra.", :note_confirmation=>"Tu pago será confirmado a través de SMS y correo electronico. ¡Gracias por usar ComproPago!"}, @dirty_attributes=#<Set: {}>>}, @dirty_attributes=#<Set: {}>, @_status=200>

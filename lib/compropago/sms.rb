module Compropago
  class SMS < Base
     post :create, "/charges/:payment_id/sms"
  end
end

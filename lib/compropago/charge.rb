module Compropago
  class Charge < Base
     get :find, "/charges/:id"
     post :create, "/charges"
     
     STORES = %w(OXXO SEVEN_ELEVEN EXTRA CHEDRAUI ELEKTRA COPPEL 
     FARMACIA_BENAVIDES FARMACIA_ESQUIVAR)
  end
end

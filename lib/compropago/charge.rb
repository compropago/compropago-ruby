module Compropago
  class Charge < Base
     get :find, "/charges/:id"
     post :create, "/charges"

     STORES = %w(OXXO WALMART SAMS_CLUB ELEKTRA EL_PORTON
     FARMACIA_ESQUIVAR SEVEN_ELEVEN SORIANA BODEGA_AURRERA
     COPPEL FARMACIA_BENAVIDES FARMACIA_GUADALAJARA FARMACIA_ESQUIVAR)
  end
end

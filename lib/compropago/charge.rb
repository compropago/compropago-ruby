module Compropago
  class Charge < Base
     get :find, "/charges/:id"
     post :create, "/charges"
  end
end

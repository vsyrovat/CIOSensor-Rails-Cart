class HomeController < ApplicationController
  def index
    @cart =
      if session[:cart_id]
        Cart.find(session[:cart_id])
      else
        cart = Cart.new
        cart.save!
        session[:cart_id] = cart.id
        cart
      end
  end
end

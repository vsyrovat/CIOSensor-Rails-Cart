class ApplicationController < ActionController::Base
  def current_cart
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

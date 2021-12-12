class ApplicationController < ActionController::Base
  def current_cart
    get_cart || create_cart
  end

  private

  def get_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def create_cart
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end

class Api::V1::CartController < ApplicationController
  def index
    render json: { cart: current_cart.to_api }, status: 200
  end
end

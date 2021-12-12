class Api::V1::CartController < ApplicationController
  def index
    render json: { cart: current_cart.to_api }, status: 200
  end

  def put_item
    good_id = Integer(params[:good_id])
    unit_id = Integer(params[:unit_id])
    count = Integer(params[:count])

    raise ArgumentError('Count should not be negative') if count.negative?

    offer = Offer.find_by!(good_id: good_id, unit_id: unit_id)

    if (item = CartItem.find_by(cart: current_cart, offer: offer))
      if count.zero?
        item.destroy
      else
        item.count = count
        item.save!
      end
    elsif !count.zero?
      CartItem.create!({cart: current_cart, offer: offer, count: count})
    end

    render json: { ok: true }, status: 200

  rescue ArgumentError => e
    render json: {ok: false, error: e.message}, status: 400
  rescue ActiveRecord::RecordNotFound => e
    render json: { ok: false, error: e.message }, status: 400
  end
end

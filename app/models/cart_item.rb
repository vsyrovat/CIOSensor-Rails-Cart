class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :offer
  monetize :price_cents

  def human_count
    "#{count} #{offer.unit.name}"
  end

  def to_api
    {
      good: offer.good.to_api,
      unit: offer.unit.to_api,
      count: count,
      price: price
    }
  end
end

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :offer
  monetize :price_cents

  def human_count
    "#{count} #{offer.unit.name}"
  end
end

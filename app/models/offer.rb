class Offer < ApplicationRecord
  belongs_to :unit
  belongs_to :good
  monetize :price_cents

  def human_price
    "#{price} #{price_currency}"
  end
end

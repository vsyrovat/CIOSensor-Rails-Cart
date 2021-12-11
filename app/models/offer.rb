class Offer < ApplicationRecord
  belongs_to :unit
  belongs_to :good
  monetize :price_cents

  def human_price
    "#{price} #{price_currency}"
  end

  def to_api
    {
      id: id,
      good_id: good.id,
      unit_id: unit.id
    }
  end

  class << self
    def to_api(offers)
      offers.map { |o| [o.id, o.to_api] }.to_h
    end
  end
end

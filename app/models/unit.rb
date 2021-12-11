class Unit < ApplicationRecord
  has_many :offers
  has_many :goods, through: :offers

  def to_api
    {id: id, name: name}
  end

  class << self
    def to_api(units)
      units.map { |u| [u.id, u.to_api] }.to_h
    end
  end
end

class Good < ApplicationRecord
  has_many :offers
  has_many :units, through: :offers

  def to_api
    {id: id, name: name}
  end

  class << self
    def to_api(goods)
      goods.map { |g| [g.id, g.to_api] }.to_h
    end
  end
end

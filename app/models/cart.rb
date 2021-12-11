class Cart < ApplicationRecord
  has_many :cart_items

  def items
    cart_items
  end

  def total_cost
    cart_items
      .map { |item| item.count * item.price }
      .reduce(Money.new(0)) { |acc, price| acc + price }
  end

  def to_api
    {
      items: items.map(&:to_api),
      total_cost: total_cost
    }
  end
end

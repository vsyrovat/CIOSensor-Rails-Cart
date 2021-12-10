class Cart < ApplicationRecord
  has_many :cart_items

  def items
    cart_items
  end
end

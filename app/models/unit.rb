class Unit < ApplicationRecord
  has_many :offers
  has_many :goods, through: :offers
end

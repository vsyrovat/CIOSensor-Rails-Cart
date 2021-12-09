class Good < ApplicationRecord
  has_many :offers
  has_many :units, through: :offers
end

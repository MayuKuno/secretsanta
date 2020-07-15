class Giver < ApplicationRecord
  has_many :post_givers
  has_many :posts, through: :post_givers
end

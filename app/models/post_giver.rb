class PostGiver < ApplicationRecord
  belongs_to :post
  belongs_to :giver
end

class PostCategory < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :post, optional: true
end

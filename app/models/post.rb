class Post < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  belongs_to :user, optional: true 
  has_many :post_givers, dependent: :destroy
  has_many :givers, through: :post_givers, dependent: :destroy
  mount_uploader :image, ImageUploader
  # has_many :post_users
  # has_many :users, through: :post_users

  def self.search(search)
    if search
      Category.where('name LIKE(?)', "%#{search}%")
    else
      Category.all
    end
  end
end

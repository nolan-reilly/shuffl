class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_by_users, through: :likes, source: :user
end

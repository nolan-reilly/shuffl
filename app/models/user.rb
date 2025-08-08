class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  # Users this user is following
  has_many :following, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followings, through: :following, source: :followed

  # Users who follow this user
  has_many :follower, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :follower, source: :follower

  # Posts
  has_many :posts
end

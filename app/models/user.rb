class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Users this user is following
  has_many :active_follows,
           foreign_key: :follower_id,
           class_name: "Follow",
           dependent: :destroy
  has_many :followings, through: :active_follows, source: :followed

  # Users who follow this user
  has_many :passive_follows,
           foreign_key: :followed_id,
           class_name: "Follow",
           dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  # Posts
  has_many :posts
end

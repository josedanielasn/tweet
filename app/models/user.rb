class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :retweets, foreign_key: "reposter_id", dependent: :destroy
  has_many :reposts, through: :retweets, source: :repost
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :firstname, presence: true, length: {minimum:2, maximum:15}
  validates :lastname, presence: true, length: {minimum:2, maximum:15}
  validates :username, presence: true, length: {minimum:2, maximum:25}, uniqueness: true;
end

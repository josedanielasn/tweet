class Post < ApplicationRecord
  belongs_to :user
  has_many :retweets, foreign_key: "repost_id", dependent: :destroy
  has_many :reposters, through: :retweets, source: :reposter
  validates :message, presence: true, length: {maximum:280}
end

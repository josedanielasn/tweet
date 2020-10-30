class Post < ApplicationRecord
  belongs_to :user
  has_many :retweets, foreign_key: "repost_id", dependent: :destroy
  has_many :reposters, through: :retweets, source: :reposter
  has_many :mentions, foreign_key: "mentioner_id", dependent: :destroy
  has_many :mentionees, through: :mentions, source: :mentionee
  validates :message, presence: true, length: {maximum:280}
end

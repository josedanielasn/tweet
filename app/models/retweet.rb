class Retweet < ApplicationRecord
  belongs_to :reposter, class_name: "User"
  belongs_to :repost, class_name: "Post"
end

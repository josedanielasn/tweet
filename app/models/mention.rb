class Mention < ApplicationRecord
  belongs_to :mentionee, class_name: "User"
  belongs_to :mentioner, class_name: "Post"
end

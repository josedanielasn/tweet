class Notification < ApplicationRecord
  belongs_to :user
  scope :mention, -> { where(type_notif: "mention") }
  scope :recent_notification, -> { where(seen: false)}
end

class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :type_notif
      t.boolean :seen, default: false
      t.integer :event_id
      t.integer :user_id
      t.timestamps
    end
  end
end

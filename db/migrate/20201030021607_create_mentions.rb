class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.integer :mentioner_id
      t.integer :mentionee_id
      t.timestamps
    end
  end
end

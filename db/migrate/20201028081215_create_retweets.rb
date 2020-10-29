class CreateRetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :retweets do |t|
      t.integer :repost_id
      t.integer :reposter_id
      t.timestamps
    end
    add_index(:retweets, [:reposter_id, :repost_id], unique: true)
  end
end

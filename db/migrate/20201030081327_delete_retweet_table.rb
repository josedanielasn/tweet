class DeleteRetweetTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :retweets
  end
end

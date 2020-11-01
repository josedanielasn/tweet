class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :retwit_id, :integer, default: nil
    add_column :posts, :owner_id, :integer, default: nil
  end
end

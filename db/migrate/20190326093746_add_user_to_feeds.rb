class AddUserToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :user_id, :integer
  end
end

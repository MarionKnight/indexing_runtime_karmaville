class AddUserTotalKarmaToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :user_total_karma, :integer, :default => 0
  end
end

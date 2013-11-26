class AddIndexToKarmaPointsTable < ActiveRecord::Migration
  def change
    add_index :karma_points, :user_id
    add_index :karma_points, :value, order: { :value => :asc }

    # add_index :karma_points, [:user_id, :value], order: { :value => :desc }
  end
end


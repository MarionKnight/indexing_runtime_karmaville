class AddMoreIndex < ActiveRecord::Migration
  def change
    # add_index :karma_points, [:user_id, :value]
    add_index :karma_points, [:user_id, :value], order: { :value => :desc }
  end
end

class AddUserIdToGoal < ActiveRecord::Migration
  def self.up
    add_column :goals, :user_id, :integer
  end

  def self.down
    remove_column :goals, :user_id
  end
end

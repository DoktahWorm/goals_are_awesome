class AddOwnerToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :owner_id, :integer
    add_column :goals, :owner_type, :string
  end

  def self.down
    remove_column :goals, :owner_id
    remove_column :goals, :owner_type
  end
end

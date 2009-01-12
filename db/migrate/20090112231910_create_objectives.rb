class CreateObjectives < ActiveRecord::Migration
  def self.up
    create_table :objectives do |t|
      t.integer :user_id
      t.integer :goal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :objectives
  end
end

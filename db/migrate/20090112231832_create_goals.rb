class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :complete
      t.datetime :target_completion_date
      t.integer :owner_id
      t.string :owner_type
      t.string :type
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end

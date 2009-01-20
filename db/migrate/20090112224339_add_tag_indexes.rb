class AddTagIndexes < ActiveRecord::Migration
  def self.up
    add_index :tags, :name, :unique => true
    add_index :taggings, [:tag_id, :taggable_id, :taggable_type], :unique => true
  end

  def self.down
    remove_index :taggings, [:tag_id, :taggable_id, :taggable_type]
    remove_index :tags, :name
  end
end

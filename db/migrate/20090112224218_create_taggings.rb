class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :tag_id, :null => false
      t.integer :taggable_id, :null => false
      t.string  :taggable_type, :null => false
      # t.column :position, :integer # Uncomment this if you need to use <tt>acts_as_list</tt>.
    end
  end

  def self.down
    drop_table :taggings
  end
end

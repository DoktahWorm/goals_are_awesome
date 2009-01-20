class RenameGoalShortAndLongDescriptionToTitleAndDescriptionColumns < ActiveRecord::Migration
  def self.up
    rename_column :goals, :short_desc, :title
    rename_column :goals, :long_desc, :description
  end

  def self.down
    rename_column :goals, :description, :long_desc
    rename_column :goals, :title, :short_desc
  end
end

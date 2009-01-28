class Goal < ActiveRecord::Base
  attr_accessible :short_desc, :long_desc, :tags_for_new, :tags_for_existing
  belongs_to :owner, :polymorphic => true

  def associate_new_or_existing( tag_name )
    tag = Tag.find_or_initialize_by_name(tag_name)
    if tag.new_record?
      tags.build :name => tag_name
    else
      tags << tag
    end    
  end
  
  def tags_not_added_yet_from( tag_list )
    split = tag_list.downcase.split(" ")
    previous_tags = tags.map(&:name)
    split - previous_tags    
  end
  
  def tags_missing_from( tag_list )
    split = tag_list.downcase.split(" ")
    previous_tags = tags.map(&:name)
    previous_tags - split
  end
  
  def tags_for_new=( tag_list )
    tag_list.split(" ").each do |tag_name|
      associate_new_or_existing tag_name
    end
  end
  
  def tags_for_existing=( tag_list )
    # if goal already has tag disregard
    tags_to_add = tags_not_added_yet_from tag_list
    tags_to_add.each do |tag_name|
      associate_new_or_existing tag_name
    end
    
    # must remove tags not in list too!!!
    tags_to_remove = tags_missing_from tag_list
    tags_to_remove.each do |tag_name|
      tags.delete( Tag.find_by_name( tag_name ) )
    end
  end
  
end

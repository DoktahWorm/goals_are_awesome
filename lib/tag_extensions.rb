# Pulled from this tutorial: 
# http://blog.evanweaver.com/articles/2007/01/13/growing-up-your-acts_as_taggable/
# It's not cargo-culting if you understand it!

class ActiveRecord::Base
  
  def tag_with tag_array
    # tags.downcase.split(" ").each do |tag|
    #   Tag.find_or_create_by_name(tag).taggables << self
    # end
    tag_array.flatten.map{ |tag| tag.downcase }.each do |tag|
      Tag.find_or_create_by_name(tag).taggables << self
    end
  end
  # alias :tags=          :tag_with
  alias :tag_with_array :tag_with
  
  def tag_with_string tags
    tag_with( tags.split(" ") )
  end
  
  def tag_delete tag_array
    # split = tag_string.split(" ")
    tags_given = tag_array.flatten.map{ |tag| tag.downcase }
    tags.delete tags.select{|t| tags_given.include? t.name}
  end
  alias :tag_delete_with_array :tag_delete
  
  def tag_delete_with_string tag_string
    split = tag_string.split(" ")
    tag_delete( split )
    # tags.delete tags.select{|t| split.include? t.name}
  end
  
  def tag_list
    tags.map(&:name)
  end
  alias :tag_list_as_array :tag_list
  
  def tag_list_as_string
    tag_list.join(' ')
  end
    
end
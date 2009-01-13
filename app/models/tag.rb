class Tag < ActiveRecord::Base
  has_many_polymorphs :taggables, 
      :from => [:goals], 
      :through => :taggings,
      :dependent => :destroy
  
  def self.find_popular(args = {})
    find(:all, :select => 'tags.*, count(*) as popularity', 
      :limit => args[:limit] || 10,
      :joins => "JOIN taggings ON taggings.tag_id = tags.id",
      :conditions => args[:conditions],
      :group => "taggings.tag_id", 
      :order => "popularity DESC"  )
  end
end

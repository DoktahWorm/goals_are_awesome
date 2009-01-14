module GaaTagExtensions
  def self.included(klass)
    klass.extend(GaaTagExtensionsClassMethods)
  end
  
  module GaaTagExtensionsClassMethods
    def find_popular(args = {})
      find(:all, :select => 'tags.*, count(*) as popularity', 
        :limit => args[:limit] || 10,
        :joins => "JOIN taggings ON taggings.tag_id = tags.id",
        :conditions => args[:conditions],
        :group => "taggings.tag_id", 
        :order => "popularity DESC"  )
    end
  
    def top_ten
      find_popular :limit => 10
    end
  end
end
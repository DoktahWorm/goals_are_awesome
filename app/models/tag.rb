class Tag < ActiveRecord::Base
  has_many_polymorphs :taggables, 
      :from => [:goals], 
      :through => :taggings,
      :dependent => :destroy
end

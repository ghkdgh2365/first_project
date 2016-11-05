class Post < ActiveRecord::Base
    
    acts_as_taggable
    
    def tag_list_fixed
      tag_list.to_s
    end
    
    def tag_list_fixed=(tag_list_string)
      self.tag_list = tag_list_string
    end
    
    has_many :comments, dependent: :destroy
      resourcify
      include Authority::Abilities
    belongs_to :user
end

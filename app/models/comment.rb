class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  resourcify
  include Authority::Abilities
  validates :body, presence: true
end

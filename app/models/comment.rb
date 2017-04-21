class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :parent,  class_name: "Comment" #-> requires "parent_id" column
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  resourcify
  include Authority::Abilities
  validates :body, presence: true
end

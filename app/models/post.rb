class Post < ActiveRecord::Base
  validates :author, :content, :title, :presence => true
  has_many :comments
 end


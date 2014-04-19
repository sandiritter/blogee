class Post < ActiveRecord::Base
  validates :author, :content, :title, :presence => true
 end

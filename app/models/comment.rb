class Comment < ActiveRecord::Base
  attr_accessor :post
  validates :author, length: { minimum: 1, message: " can't be blank" }
  validates :content,  length: { minimum: 15 ,message: " must be at least 15 characters long." }
  
end




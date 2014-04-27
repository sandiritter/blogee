class User < ActiveRecord::Base
  has_secure_password
  before_save :lowercase_user
  validates :password, length: { minimum: 8}
  validates :email, :username, uniqueness: true
  has_many :posts 
    
  private
  def lowercase_user
    username.downcase!
    email.downcase!
  end
end

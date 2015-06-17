class User < ActiveRecord::Base

  has_secure_password
  has_many :snippets, dependent: :nullify

  validates_presence_of :email, :user_name
  validates_uniqueness_of :email, :user_name
  
end

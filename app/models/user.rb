class User < ActiveRecord::Base
  attr_accessible :email, :name
  before_save { |user| user.email = email.downcase }
  validates :name, presence: true, length: { maximum: 64 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
end

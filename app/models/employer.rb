class Employer < ApplicationRecord
  
  validates :name, presence: true
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :location, presence: true
  validates :branch, presence: true
  
  has_secure_password
end
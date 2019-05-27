class Employer < ApplicationRecord
  has_many :jobs, dependent: :destroy
  validates :full_name, presence: true
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, uniqueness: true, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :location, presence: true
  
  has_secure_password
end
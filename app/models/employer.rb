class Employer < ApplicationRecord
  has_many :jobs, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :location, presence: true
  validates :branch, presence: true
  
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_secure_password
end
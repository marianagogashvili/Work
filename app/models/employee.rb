class Employee < ApplicationRecord
  validates :full_name, presence: true
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :address, presence: true

  has_many :job_employees, dependent: :destroy
  has_many :jobs, through: :job_employees

  has_many :saved, dependent: :destroy
  has_many :jobs, through: :saved
  has_secure_password
end
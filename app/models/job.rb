class Job < ApplicationRecord
  belongs_to :employer

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :contract_type, presence: true
  
  has_many :job_employees
  has_many :employees, through: :job_employees
end
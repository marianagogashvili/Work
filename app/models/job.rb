class Job < ApplicationRecord
  belongs_to :employer

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :contract_type, presence: true
  
  has_many :job_employees
  has_many :employees, through: :job_employees
  
  has_many :saved
  has_many :users, through: :saved
  # def self.search(search)
  #   where("title LIKE ?", "%#{search}%")
  #   where("WHERE contract_type = ", "%#{search}%")
  #   where("WHERE vacant = true")
  #   #location
  # end
end
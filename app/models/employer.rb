class Employer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :location, presence: true
  validates :branch, presence: true
  

end
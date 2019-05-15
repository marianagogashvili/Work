class Message < ApplicationRecord
  belongs_to :employee
  belongs_to :employer
  created_at.strftime('%H:%M:%S %d %B %Y')
end
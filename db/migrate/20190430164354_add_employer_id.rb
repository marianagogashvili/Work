class AddEmployerId < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :employer_id, :integer
  end
end

class ChangeEmployeesName < ActiveRecord::Migration[5.1]
  def change
    rename_column :employers, :name, :full_name
  end
end

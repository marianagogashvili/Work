class AddArr < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :education
  end
end

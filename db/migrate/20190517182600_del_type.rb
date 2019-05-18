class DelType < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :type
  end
end

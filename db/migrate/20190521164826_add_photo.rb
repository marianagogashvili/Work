class AddPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :photo, :string
    add_column :employers, :photo, :string
    add_column :jobs, :photo, :string

  end
end

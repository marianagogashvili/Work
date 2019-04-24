class AddPassword < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :password_digest, :string
    add_column :employers, :password_digest, :string
    
  end
end

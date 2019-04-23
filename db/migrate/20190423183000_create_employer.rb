class CreateEmployer < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :founded
      t.integer :number_of_employees
      t.string :description
      t.string :type
      t.string :branch
    end
  end
end

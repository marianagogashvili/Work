class CreateEmployee < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :email
      t.string :address
      t.string :education
      t.string :career_level
      t.string :type
      t.string :branch
    end
  end
end

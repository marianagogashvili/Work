class AddArr2 < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :education, :text, default: [].to_yaml
  end
end

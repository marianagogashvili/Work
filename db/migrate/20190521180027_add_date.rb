class AddDate < ActiveRecord::Migration[5.1]
  def change
    rename_column :jobs, :created_at, :date
  end
end

class DelDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :date
  end
end

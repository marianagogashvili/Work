class AddLocationToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :location, :string
  end
end

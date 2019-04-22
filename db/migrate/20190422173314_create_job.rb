class CreateJob < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :contract_type
      t.boolean :vacant
      t.datetime :created_at
    end
  end
end

class CreateSaved < ActiveRecord::Migration[5.1]
  def change
    create_table :saveds do |t|
      t.integer :job_id
      t.integer :employee_id
    end
  end
end

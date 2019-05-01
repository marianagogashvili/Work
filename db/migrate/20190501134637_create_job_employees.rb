class CreateJobEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :job_employees do |t|
      t.integer :job_id
      t.integer :employee_id
      t.boolean :approved, default: false
    end
  end
end

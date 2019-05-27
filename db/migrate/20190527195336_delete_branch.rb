class DeleteBranch < ActiveRecord::Migration[5.1]
  def change
    remove_column :employers, :branch
  end
end

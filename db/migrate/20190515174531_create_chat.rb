class CreateChat < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :title
    end
  end
end

class DeleteChats < ActiveRecord::Migration[5.1]
  def change
    drop_table :chats
  end
end

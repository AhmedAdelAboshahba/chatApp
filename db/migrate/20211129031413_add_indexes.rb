class AddIndexes < ActiveRecord::Migration[5.2]
  def up
    add_index :applications, :token, unique: true
    add_index :chats, [:application_id, :number], unique: true
    add_index :messages, [:chat_id, :number], unique: true
  end

  def down
    remove_index :applications, :token
    remove_index :chats, [:application_id, :number]
    remove_index :messages, [:chat_id, :number]
  end
end

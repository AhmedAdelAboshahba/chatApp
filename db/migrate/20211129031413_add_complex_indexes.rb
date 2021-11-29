class AddComplexIndexes < ActiveRecord::Migration[5.2]
  def up
    add_index :chats, [:application_id, :number]
    add_index :messages, [:chat_id, :number]
  end

  def down
    remove_index :chats, [:application_id, :number]
    remove_index :messages, [:chat_id, :number]
  end
end

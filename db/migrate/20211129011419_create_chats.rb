class CreateChats < ActiveRecord::Migration[5.2]
  def up
    create_table :chats do |t|
      t.references :application
      t.integer :number
      t.integer :messages_size, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :chats
  end
end

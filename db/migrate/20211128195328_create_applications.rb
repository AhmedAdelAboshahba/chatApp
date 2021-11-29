class CreateApplications < ActiveRecord::Migration[5.2]
  def up
    create_table :applications do |t|
      t.string :token
      t.string :name
      t.integer :chats_size, default: 0
      t.timestamps
    end
    add_index :applications, :token
  end

  def down
    remove_index :applications, :token
    drop_table :applications
  end
end

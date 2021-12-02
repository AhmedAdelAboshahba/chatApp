class CreateMessages < ActiveRecord::Migration[5.2]
  def up
    create_table :messages do |t|
      t.references :chat
      t.string :content
      t.integer :number
      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
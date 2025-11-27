class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
    add_index :messages, :room_id
    add_index :messages, :user_id
  end
end

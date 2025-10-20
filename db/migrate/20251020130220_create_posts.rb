class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :status, default: 0, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end

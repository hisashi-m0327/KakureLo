class AddHiddenToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :hidden, :boolean, default: false, null: false
  end
end

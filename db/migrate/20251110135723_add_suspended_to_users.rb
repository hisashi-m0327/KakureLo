class AddSuspendedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :suspended, :boolean
    add_column :users, :default, :false
  end
end

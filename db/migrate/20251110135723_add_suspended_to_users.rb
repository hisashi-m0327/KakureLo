class AddSuspendedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :suspended, :boolean, default: false, null: false
  end
end


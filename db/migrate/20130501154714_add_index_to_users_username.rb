class AddIndexToUsersUsername < ActiveRecord::Migration
  def change
    add_index :users, :username, uniq: true 
  end
end

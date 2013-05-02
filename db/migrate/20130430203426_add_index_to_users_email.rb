class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, uniq: true
  end
end

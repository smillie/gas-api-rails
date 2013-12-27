class AddIndexToNewMembersEmail < ActiveRecord::Migration
  def change
    add_index :new_members, :email, unique: true
  end
end

class CreateNewMembers < ActiveRecord::Migration
  def change
    create_table :new_members do |t|
      t.string :firstname
      t.string :lastname
      t.string :studentnumber
      t.string :email

      t.timestamps
    end
  end
end

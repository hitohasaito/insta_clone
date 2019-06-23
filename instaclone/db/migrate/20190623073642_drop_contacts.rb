class DropContacts < ActiveRecord::Migration[5.1]
  def change
    drop_table :contacts
  end
end

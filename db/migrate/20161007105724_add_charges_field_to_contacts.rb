class AddChargesFieldToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :amount, :integer
  end
end

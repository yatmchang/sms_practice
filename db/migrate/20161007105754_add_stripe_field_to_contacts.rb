class AddStripeFieldToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :stripe_transaction_id, :string
  end
end

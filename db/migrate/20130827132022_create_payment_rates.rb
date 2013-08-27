class CreatePaymentRates < ActiveRecord::Migration
  def change
    create_table :payment_rates do |t|
      t.integer :sow_id
      t.integer :version
      t.string :state
      t.float :transaction_fee
      t.float :subscription_fee
      t.integer :term
      t.string :maintype

      t.timestamps
    end
  end
end

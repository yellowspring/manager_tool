class RenameCombinedtransactionToPayment < ActiveRecord::Migration
  def change
     rename_column :sow_details, :transaction_fee, :payment_transaction_fee
     rename_column :sow_details, :subscription_fee, :payment_subscription_fee
     rename_column :sow_details, :combined_subscription_fee, :charity_subscription_fee
     rename_column :sow_details, :combined_transaction_fee, :charity_transaction_fee
  end
end

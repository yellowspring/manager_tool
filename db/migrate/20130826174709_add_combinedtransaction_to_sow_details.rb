class AddCombinedtransactionToSowDetails < ActiveRecord::Migration
  def change
     add_column :sow_details, :combined_transaction_fee, :float
     add_column :sow_details, :combined_subscription_fee, :float
  end
end

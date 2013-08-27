class RemoveStateFromPaymentRates < ActiveRecord::Migration
  def change
     remove_column :payment_rates, :state 
     remove_column :charity_rates, :state 
  end
end

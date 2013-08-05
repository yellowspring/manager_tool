class AddRateToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
        t.boolean :commercial_rate
        t.boolean :medicaid_rate
        t.boolean :medicare_rate
        t.boolean :term
        t.boolean :monthly_fee
        t.boolean :transaction_fee
        t.boolean :development_fee
    end
  end
end

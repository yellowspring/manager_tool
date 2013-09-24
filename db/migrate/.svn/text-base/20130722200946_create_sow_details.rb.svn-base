class CreateSowDetails < ActiveRecord::Migration
  def change
    create_table :sow_details do |t|
      t.float :commercial_rate
      t.float :medicare_rate
      t.float :medicaid_rate
      t.integer :term
      t.integer :version
      t.string :status
      t.float :development_fee
      t.float :outgoing_monthly_fee
      t.float :transaction_net_fee

      t.timestamps
    end
  end
end

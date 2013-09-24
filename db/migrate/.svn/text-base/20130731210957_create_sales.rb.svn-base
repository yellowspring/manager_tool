class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :salesperson
      t.references :contract

      t.timestamps
    end
    add_index :sales, :salesperson_id
    add_index :sales, :contract_id
  end
end

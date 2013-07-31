class CreateSalespeopleContracts < ActiveRecord::Migration
  def change
    create_table :salespeople_contracts, :id => false do |t|
      t.references :salesperson
      t.references :contract

      t.timestamps
    end
    add_index :salespeople_contracts, [:salesperson_id,:contract_id],:unique => true
  end
end

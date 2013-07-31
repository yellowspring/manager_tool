class DropSalespeopleContracts < ActiveRecord::Migration
  def change
	drop_table :salespeople_contracts
  end
end

class AddExecutedToContract < ActiveRecord::Migration
  def change
	rename_column :contracts, :contract_execute_date,:contract_executed_at
  end
end

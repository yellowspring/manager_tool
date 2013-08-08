class ChangeColumnInSales < ActiveRecord::Migration
  def change
	rename_column :sales, :contract_id, :client_id
  end
end

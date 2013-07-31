class DropSalesContractships < ActiveRecord::Migration
  def change
	drop_table :sales_contractships 
  end
end

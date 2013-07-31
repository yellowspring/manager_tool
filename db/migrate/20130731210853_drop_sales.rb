class DropSales < ActiveRecord::Migration
  def change
	drop_table :sales 
  end
end

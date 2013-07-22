class RenameCustIdToCustid < ActiveRecord::Migration
  def up
     rename_column :clients, :cust_id, :custid
  end

  def down
    rename_column :clients, :custid, :cust_id
  end
end

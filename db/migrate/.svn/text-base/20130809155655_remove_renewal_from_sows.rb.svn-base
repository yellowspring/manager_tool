class RemoveRenewalFromSows < ActiveRecord::Migration
  def change 
    remove_column :sows, :renewal
    rename_column :sows, :ca_fla, :ca_flag
  end
end

class RemoveNdaFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :baa_date 
    remove_column :contracts, :nda_date 
    remove_column :contracts, :nda_flag 
    remove_column :contracts, :ca_date 
    remove_column :contracts, :ca_flag 
    add_column    :sows, :ca_sign_date, :date
    add_column    :sows, :ca_fla, :boolean
    
  end
end

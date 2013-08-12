class RenameCaInSows < ActiveRecord::Migration
  def change
	rename_column :sows, :ca_sign_date, :ca_sign_at 
  end
end

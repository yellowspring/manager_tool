class ChangeTableContracts < ActiveRecord::Migration
  def change
	change_table :contracts do |t|
  		t.rename :nda_data, :nda_date
	end
  end
end

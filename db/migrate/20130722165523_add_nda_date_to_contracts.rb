class AddNdaDateToContracts < ActiveRecord::Migration
  def change
     add_column :contracts, :nda_data, :date
     add_column :contracts, :nda_flag, :string
  end
end

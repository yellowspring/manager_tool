class AddClientStateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :client_state, :string
    add_column :contracts, :ca_flag, :string
    add_column :contracts, :ca_date, :date
    add_column :contracts, :contract_execute_date, :date
    add_column :contracts, :client_id, :integer
    add_column :contracts, :contract_type, :string
    add_column :contracts, :client_name, :string
  end
end

class AddUpdatedToSows < ActiveRecord::Migration
  def change
      add_column :sows, :updated_by, :string
      add_column :sow_files, :updated_by, :string
      add_column :sows, :deleted, :boolean
      add_column :contractfiles, :updated_by, :string
      add_column :ca_files, :updated_by, :string
      add_column :contracts, :updated_by, :string
      add_column :ndafiles, :updated_by, :string
      add_column :baafiles, :updated_by, :string
      add_column :clients, :detedted, :boolean
      add_column :clients, :updated_by, :string
  end
end

class AddVersionToContractfiles < ActiveRecord::Migration
  def change
      add_column :contractfiles,:version, :integer
      add_column :ca_files,:version, :integer
      remove_column :contractfiles,:file
      add_column :contractfiles,:file,:oid
      remove_column :ca_files,:file
      add_column :ca_files,:file,:oid
      remove_column :sow_files,:file
      add_column :sow_files,:file,:oid
  end
end

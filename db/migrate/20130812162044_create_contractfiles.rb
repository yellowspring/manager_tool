class CreateContractfiles < ActiveRecord::Migration
  def change
    create_table :contractfiles do |t|
      t.integer :contract_id
      t.string :file

      t.timestamps
    end
    drop_table :contract_files
  end
end

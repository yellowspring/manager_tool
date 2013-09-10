class CreateCaFiles < ActiveRecord::Migration
  def change
    create_table :ca_files do |t|
      t.integer :contract_id
      t.string :file
      t.binary :filecontent

      t.timestamps
    end
  end
end

class CreateAutointelSowFiles < ActiveRecord::Migration
  def change
    create_table :autointel_sow_files do |t|
      t.integer :sow_id
      t.integer :version
      t.string :file
      t.binary :file_content

      t.timestamps
    end
  end
end

class CreateBaafiles < ActiveRecord::Migration
  def change
    create_table :baafiles do |t|
      t.integer :client_id
      t.string :file
      t.binary :filecontent

      t.timestamps
    end
  end
end

class CreateAutointelRates < ActiveRecord::Migration
  def change
    create_table :autointel_rates do |t|
      t.integer :sow_id
      t.integer :version
      t.string :state
      t.float :rate
      t.integer :term
      t.string :maintype

      t.timestamps
    end
  end
end

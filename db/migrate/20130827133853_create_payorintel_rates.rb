class CreatePayorintelRates < ActiveRecord::Migration
  def change
    create_table :payorintel_rates do |t|
      t.integer :sow_id
      t.integer :version
      t.integer :term
      t.string :maintype
      t.string :subtype
      t.float :commercial
      t.float :medicare
      t.float :medicaid
      t.float :global

      t.timestamps
    end
  end
end

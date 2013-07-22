class CreateSows < ActiveRecord::Migration
  def change
    create_table :sows do |t|
      t.date :sow_ko_date
      t.date :sow_production_date
      t.date :sow_start_date
      t.date :sow_end_date
      t.string :auto_renew
      t.integer :accept_term
      t.string :renewal
      t.integer :renew_times
      t.integer :product_id
      t.text :comment

      t.timestamps
    end
  end
end

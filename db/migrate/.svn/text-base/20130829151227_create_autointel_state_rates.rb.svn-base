class CreateAutointelStateRates < ActiveRecord::Migration
  def change
    create_table :autointel_state_rates do |t|
      t.integer :autointel_rate_id
      t.string :state
      t.float :rate

      t.timestamps
    end

    remove_column :autointel_rates, :state, :rate
  end
end

class AddScoreToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :development_fee,:term,:monthly_fee
    add_column :products, :score, :boolean
    add_column :products, :subscription_fee, :boolean
    add_column :products, :global_rate, :boolean
  end
end

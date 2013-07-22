class CreateSowDetailTemplates < ActiveRecord::Migration
  def change
    create_table :sow_detail_templates do |t|
      t.boolean :commercial_rate
      t.boolean :medicare_rate
      t.boolean :medicaid_rate
      t.boolean :term
      t.boolean :development_fee
      t.boolean :outgoing_monthly_fee
      t.boolean :transaction_net_fee
      t.integer :sow_id

      t.timestamps
    end
  end
end

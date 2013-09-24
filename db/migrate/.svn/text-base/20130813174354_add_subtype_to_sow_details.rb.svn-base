class AddSubtypeToSowDetails < ActiveRecord::Migration
  def change
     remove_column :sow_details,:status, :development_fee,:outgoing_monthly_fee
     rename_column :sow_details,:transaction_net_fee,:transaction_fee
     add_column :sow_details, :subscription_fee, :integer
     add_column :sow_details, :subtype, :string
     add_column :sow_details, :global_rate, :integer
  end
end

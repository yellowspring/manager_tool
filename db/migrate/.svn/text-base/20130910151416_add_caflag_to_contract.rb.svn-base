class AddCaflagToContract < ActiveRecord::Migration
  def change
     add_column :contracts, :ca_flag, :boolean
     add_column :contracts, :ca_send_at, :date
     add_column :contracts, :ca_sign_at, :date
     remove_column :sows, :ca_sign_at
     remove_column :sows, :ca_flag
     remove_column :sows, :ca_send_at
  end
end

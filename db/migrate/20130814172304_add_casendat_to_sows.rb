class AddCasendatToSows < ActiveRecord::Migration
  def change
    add_column :sows, :ca_send_at, :date
  end
end

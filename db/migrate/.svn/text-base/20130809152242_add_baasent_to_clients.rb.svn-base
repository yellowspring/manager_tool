class AddBaasentToClients < ActiveRecord::Migration
  def change
      change_table :clients do |t|
        t.date :baa_send_at
        t.date :baa_sign_at
      end
      remove_column :clients, :baa
  end
end

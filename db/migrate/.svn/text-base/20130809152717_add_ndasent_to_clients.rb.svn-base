class AddNdasentToClients < ActiveRecord::Migration
  def change
    remove_column :clients, :nda
    change_table :clients do |t|
       t.date :nda_sign_at
       t.date :nda_send_at
    end
  end
end

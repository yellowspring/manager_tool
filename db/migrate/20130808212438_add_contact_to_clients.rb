class AddContactToClients < ActiveRecord::Migration
  def change
     change_table :clients do |t|
	t.string :contact_name
     end
  end
end

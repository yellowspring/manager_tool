class RemoveClientNameFromContract < ActiveRecord::Migration
  change_table :contracts do |t|
    t.remove :client_name, :client_email
  end
end

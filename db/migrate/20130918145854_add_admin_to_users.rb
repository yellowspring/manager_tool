class AddAdminToUsers < ActiveRecord::Migration
  def change
     remove_column :users,:admin
     add_column :users,:admin,:boolean
  end
end

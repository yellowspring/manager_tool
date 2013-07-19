class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :state
      t.integer :cust_id
      t.string :phone
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end

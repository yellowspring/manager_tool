class CreateSalespeople < ActiveRecord::Migration
  def change
    create_table :salespeople do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :dob
      t.string :gender
      t.date :join_date
      t.string :status
      t.string :email
      t.string :street
      t.string :state
      t.string :city
      t.string :mobile_phone
      t.string :home_phone
      t.string :comment

      t.timestamps
    end
  end
end

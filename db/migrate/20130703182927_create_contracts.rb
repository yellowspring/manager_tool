class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :description
      t.string :product
      t.string :client
      t.string :salesperson
      t.string :contact_email
      t.date :send_date
      t.date :execute_date
      t.date :kick_off_call
      t.date :data_received_date
      t.date :data_run_date
      t.date :first_run_date_in_production
      t.string :status
      t.string :comment

      t.timestamps
    end
  end
end

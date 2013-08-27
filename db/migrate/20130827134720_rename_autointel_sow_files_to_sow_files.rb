class RenameAutointelSowFilesToSowFiles < ActiveRecord::Migration
  def change
     rename_table :autointel_sow_files, :sow_files
     drop_table :payment_sow_files 
  end
end

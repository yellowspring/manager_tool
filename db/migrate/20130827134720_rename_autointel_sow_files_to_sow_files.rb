class RenameAutointelSowFilesToSowFiles < ActiveRecord::Migration
  def change
     rename_table :autointel_sow_files, :sow_files
  end
end

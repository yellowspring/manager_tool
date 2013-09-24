class RemoveFileFromBaafiles < ActiveRecord::Migration
  def change
	remove_column :baafiles,:file
	remove_column :ndafiles,:file
        rename_column :ndafiles, :avatar, :file 
        rename_column :baafiles, :avatar, :file 
  end

end

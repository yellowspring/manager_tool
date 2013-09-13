class AddVersionToBaafile < ActiveRecord::Migration
  def change
	add_column :baafiles, :version,:integer
	add_column :ndafiles, :version,:integer
  end
end

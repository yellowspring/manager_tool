class AddDeletedToContract < ActiveRecord::Migration
  def change
	add_column :contracts,:deleted,:boolean
  end
end

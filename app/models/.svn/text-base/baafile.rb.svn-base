class Baafile < ActiveRecord::Base
	belongs_to :client

	mount_uploader :file, AvatarUploader
	attr_accessible  :file_cache,:file, :version, :updated_by

end

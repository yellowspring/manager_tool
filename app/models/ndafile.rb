class Ndafile < ActiveRecord::Base
    belongs_to :client

	mount_uploader :file, AvatarUploader
	attr_accessible  :file_cache, :file, :version

end

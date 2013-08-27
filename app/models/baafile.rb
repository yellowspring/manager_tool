class Baafile < ActiveRecord::Base
	belongs_to :client

	mount_uploader :file, AvatarUploader
	attr_accessible :file,:file_cache

end

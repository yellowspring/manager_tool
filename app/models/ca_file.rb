class CaFile < ActiveRecord::Base
	belongs_to :contract

	mount_uploader :file, AvatarUploader
	attr_accessible :file,:file_cache,:version
end

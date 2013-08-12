class Contractfile < ActiveRecord::Base
	belongs_to :contract

	mount_uploader :file, AvatarUploader
	attr_accessible :file
end

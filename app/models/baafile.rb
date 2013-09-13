class Baafile < ActiveRecord::Base
	belongs_to :client

	mount_uploader :avatar, AvatarUploader
	attr_accessible  :avatar_cache,:avatar, :version

end

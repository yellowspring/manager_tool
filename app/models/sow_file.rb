class SowFile < ActiveRecord::Base
	belongs_to :sow
	mount_uploader :file, AvatarUploader
	attr_accessible :file, :file_cache, :sow_id, :version
end

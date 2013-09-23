class SowFile < ActiveRecord::Base
	belongs_to :sow
	mount_uploader :file, AvatarUploader
	attr_accessible :file, :file_cache, :sow_id, :version, :updated_by

	validate :check_consistency

	private
	 	def check_consistency
	 		if self.file.blank? or self.file.nil?
	 			errors.add(:missing, '; You have to upload a new file')
	 			false
	 		else
	 			true
	 		end
	 	end
end

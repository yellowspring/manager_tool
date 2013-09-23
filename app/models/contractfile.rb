class Contractfile < ActiveRecord::Base
	belongs_to :contract

	mount_uploader :file, AvatarUploader
	attr_accessible :file,:file_cache, :version, :contract_id, :updated_by

	validates :file, presence: true
end

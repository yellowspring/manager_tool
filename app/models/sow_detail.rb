class SowDetail < ActiveRecord::Base
	belongs_to :sow

	mount_uploader :file, AvatarUploader
	attr_accessible :file, :file_cache, :type, :subtype, :commercial_rate, :medicare_rate, :medicaid_rate, :global_rate, :term, :subscription_fee, :transaction_fee
end

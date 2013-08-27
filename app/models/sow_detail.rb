class SowDetail < ActiveRecord::Base
	belongs_to :sow
	before_save :create_autointel

	mount_uploader :file, AvatarUploader
	attr_accessible :file, :file_cache, :autointel, :maintype, :subtype, :commercial_rate, :medicare_rate,\
					:medicaid_rate, :global_rate, :term, :payment_subscription_fee, :payment_transaction_fee, :charity_subscription_fee, :charity_transaction_fee, :state1, \

 
	protected

	def create_autointel
	end
end

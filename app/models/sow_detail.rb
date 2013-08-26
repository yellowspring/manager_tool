class SowDetail < ActiveRecord::Base
	belongs_to :sow

	mount_uploader :file, AvatarUploader
	attr_accessible :file, :file_cache, :type, :subtype, :commercial_rate, :medicare_rate, :medicaid_rate, :global_rate, :term, :subscription_fee, :transaction_fee,
					:state1, :state_rate1, 
					:state2, :state_rate2,
					:state3, :state_rate3,
					:state4, :state_rate4,
					:state5, :state_rate5,
					:state6, :state_rate6,
					:state7, :state_rate7,
					:state8, :state_rate8,
					:state9, :state_rate9,
					:state10, :state_rate10,
					:state11, :state_rate11
	def autointel
		state1 + ': ' + state_rate1 + '; '
	end

	def autointel=(state1,state_rate1)
		self.autointel = state1 + ': ' + state_rate1 + '; ' 
	end
end

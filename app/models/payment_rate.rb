class PaymentRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :transaction_fee, :subscription_fee, :term
	validate :check_consistency

     validates_numericality_of :transaction_fee, :on => :create, :allow_nil => true
	 validates_numericality_of :subscription_fee, :on => :create, :allow_nil => true
 
	 private
	 	def check_consistency
	 		if transaction_fee.blank? or subscription_fee.blank? 
	 			errors.add(:value, 'transaction_fee, subscription_fee cannot be  blank')
	 			false
	 		else
	 			true
	 		end
	 	end
end

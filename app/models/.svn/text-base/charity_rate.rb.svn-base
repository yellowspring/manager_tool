class CharityRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :transaction_fee, :subscription_fee, :term
	validate :check_charity_consistency

     validates_numericality_of :transaction_fee, :on => :create, :allow_nil => true
	 validates_numericality_of :subscription_fee, :on => :create, :allow_nil => true
 

 	def rate_with_sign(col)
		rvalue = ''
		if self.send(col).nil?
		else
				rvalue = '$' + self.send(col).to_s  
		end
		rvalue
	end

	 def details
		content = ''
		['transaction_fee','subscription_fee' ].each do |f|
			if rate_with_sign(f) =~ /%/ or rate_with_sign(f) =~ /\$/ 
				content << "#{f}:" + rate_with_sign(f) + '    '
			end
		end
		content
		
	end

	 private
	 	def check_charity_consistency
	 		if transaction_fee.blank? or subscription_fee.blank? 
	 			errors.add(:value, 'transaction_fee, subscription_fee cannot be  blank')
	 			false
	 		else
	 			true
	 		end
	 	end
end

class PayorintelRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :maintype, :subtype, :term, :commercial, :medicare, :medicaid, :global
	validate :check_consistency

	 validates_numericality_of :commercial,  :allow_nil => true
	 validates_numericality_of :medicare,   :allow_nil => true
	 validates_numericality_of :medicaid,   :allow_nil => true
	 validates_numericality_of :global,  :allow_nil => true

	def rate_with_sign(col)
		rvalue = ''
		if self.send(col).nil?
		else
			if self.maintype.to_s.downcase() == 'contingency'
				rvalue = self.send(col) + '%'
			else
				rvalue = '$' + self.send(col).to_s  
			end
		end
		rvalue
	end

	def details
		content = ''
		['commercial','medicare','medicaid','global'].each do |f|
			if rate_with_sign(f) =~ /%/ or rate_with_sign(f) =~ /\$/ 
				content << "#{f}:" + rate_with_sign(f) + '    '
			end
		end
		content
		
	end

	 private
	 	def check_consistency
	 		if commercial.blank? and medicare.blank? and medicaid.blank? and global.blank?
	 			errors.add(:value, 'commercial, medicaid, medicare and global cannot be all blank')
	 			false
	 		else
	 			true
	 		end
	 	end
end

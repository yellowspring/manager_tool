class AutointelRate < ActiveRecord::Base
 
	belongs_to :sow
	validate :check_consistency


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

	def us_states
	    [
	      ['Alabama', 'AL'],
	      ['Alaska', 'AK'],
	      ['Arizona', 'AZ'],
	      ['Arkansas', 'AR'],
	      ['California', 'CA'],
	      ['Colorado', 'CO'],
	      ['Connecticut', 'CT'],
	      ['Delaware', 'DE'],
	      ['District of Columbia', 'DC'],
	      ['Florida', 'FL'],
	      ['Georgia', 'GA'],
	      ['Hawaii', 'HI'],
	      ['Idaho', 'ID'],
	      ['Illinois', 'IL'],
	      ['Indiana', 'IN'],
	      ['Iowa', 'IA'],
	      ['Kansas', 'KS'],
	      ['Kentucky', 'KY'],
	      ['Louisiana', 'LA'],
	      ['Maine', 'ME'],
	      ['Maryland', 'MD'],
	      ['Massachusetts', 'MA'],
	      ['Michigan', 'MI'],
	      ['Minnesota', 'MN'],
	      ['Mississippi', 'MS'],
	      ['Missouri', 'MO'],
	      ['Montana', 'MT'],
	      ['Nebraska', 'NE'],
	      ['Nevada', 'NV'],
	      ['New Hampshire', 'NH'],
	      ['New Jersey', 'NJ'],
	      ['New Mexico', 'NM'],
	      ['New York', 'NY'],
	      ['North Carolina', 'NC'],
	      ['North Dakota', 'ND'],
	      ['Ohio', 'OH'],
	      ['Oklahoma', 'OK'],
	      ['Oregon', 'OR'],
	      ['Pennsylvania', 'PA'],
	      ['Puerto Rico', 'PR'],
	      ['Rhode Island', 'RI'],
	      ['South Carolina', 'SC'],
	      ['South Dakota', 'SD'],
	      ['Tennessee', 'TN'],
	      ['Texas', 'TX'],
	      ['Utah', 'UT'],
	      ['Vermont', 'VT'],
	      ['Virginia', 'VA'],
	      ['Washington', 'WA'],
	      ['West Virginia', 'WV'],
	      ['Wisconsin', 'WI'],
	      ['Wyoming', 'WY']
	    ]
	end

	def details
		content = ''
		us_states.each do |f|
			st = f[1]
			if   rate_with_sign(st) =~ /%/ or rate_with_sign(st) =~ /\$/ 
				content  << "#{f[0]}:" + rate_with_sign(st) + '     '
			end
		end
		content
	end

    def standardise_numbers
    	us_states.each do |f|
    		define_method "#{f[1]}=" do |rate_value|
    			rate_value.to_s.gsub(/[^\.\d]/, '').to_f
    			self.update_attribute(f[1], rate_value)
    		end       
    	end
    end

     private
	 	def check_consistency()
	 		allempty = attributes.all? do  |key, value| 
				if ["version", "sow_id", "sow_id", "maintype","created_at","updated_at" ].include?(key.to_s.downcase)
					true
				else
					value.blank?   
				end
			end	
	 	 	if allempty == true
	 			errors.add(:value, ';You have to fill out at least one state!')
	 			false
	 		else
	 			true
	 		end
	 	end
end

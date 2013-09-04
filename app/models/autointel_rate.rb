class AutointelRate < ActiveRecord::Base
	include 
	belongs_to :sow
	 
	before_save :standardise_numbers


	def rate_with_sign(col)
		rvalue = ''
		if self.send(col).nil?
		else
			if self.maintype.to_s.toLowerCase() == 'contingency'
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

	protected

    # Called before this object is saved to the DB
    def standardise_numbers
    	us_states.each do |f|
    		if ! self.send(f[1]).nil?
    			rate_value = self.send(f[1])
    			rate_value.gsub(/[^\./d]/, '');
    			self.write_attribute(f[1], rate_value)
    		end       
    	end
    end
end

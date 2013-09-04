module SowsHelper
	def exclude_column(col)
		result = case col
		   when "id" then false
		   when "created_at" then false
		   when "updated_at" then false
		   when "status" then false
		   when "version" then false
		   when "sow_id" then false
		   else true
		end
		return result
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
end

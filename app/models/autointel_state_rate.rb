class AutointelStateRate < ActiveRecord::Base
	belongs_to :autointel_rate

	attr_accessible :autointel_rate_id, :state, :rate
end

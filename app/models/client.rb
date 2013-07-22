class Client < ActiveRecord::Base
	has_many :contracts, dependent: :destroy

	def name_with_state
    	"#{name} in #{state}"
  	end
end

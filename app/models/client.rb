class Client < ActiveRecord::Base
	has_many :contracts, dependent: :destroy
	has_many :sales, dependent: :destroy
	has_many :salespeople, through: :sales

	accepts_nested_attributes_for :contracts, :sales, :salespeople

	def name_with_state
		if city.nil? or city =~ /^\s*$/
			"#{name}: #{state}"
		else
			"#{name}: #{city}, #{state}"
		end
  	end

  	validates :name, presence: true
  	validates :salesperson_ids, presence: true
end

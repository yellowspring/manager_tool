class Product < ActiveRecord::Base
	validates :name, presence: true

	def formal_name
		name.upcase
	end

	def self.find_all_not_in(ids)
		if ids.empty?
			find :all
		else
  			find :all, :conditions => ["id NOT IN (?)", ids]
  		end
	end
end

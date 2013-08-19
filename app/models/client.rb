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

  	def list_of_sales
  		ls = '';
		if ! salespeople.empty?  
		  salespeople.each do |s|
			ls << "#{s.first_name} #{s.last_name}" << ';'
		  end
		end
		return ls
  	end

  	def ids_of_sales
  		ids = Array.new;
		if ! salespeople.empty?  
		  salespeople.each do |s|
			ids << s.id
		  end
		end
		return ids.join(",")
  	end

  	validates :name, presence: true
  	validates :salesperson_ids, presence: true
  	validates :cust_id, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  	validates :phone, :allow_nil => true,:allow_blank => true, :numericality => true,:length => { :minimum => 10, :maximum => 15 }
  	validates_format_of :email, :allow_blank => true, :presence => false, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end

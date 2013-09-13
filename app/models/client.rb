class Client < ActiveRecord::Base
	has_many :contracts, dependent: :destroy, :order => "id"
	has_many :baafiles, dependent: :destroy, :order => "id"
	has_many :ndafiles, dependent: :destroy, :order => "id"
	has_many :sales, dependent: :destroy
	has_many :salespeople, through: :sales


	accepts_nested_attributes_for :contracts, :sales, :salespeople, :baafiles, :ndafiles
	accepts_nested_attributes_for :baafiles,  :reject_if => :child_invalide,:allow_destroy => true 
	accepts_nested_attributes_for :ndafiles,  :reject_if => :child_invalide,:allow_destroy => true 

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

  	def self.clients_id_and_name
  		option_list = Array.new();
  		#option_list << ["All", 0];
  		Client.find(:all).each do |c|
  			option_list << ["#{c.name_with_state.upcase}", c.id]
  		end
  		option_list.sort
  	end

  	validates :name, presence: true
  	validates :salesperson_ids, presence: true
  	validates :cust_id, :numericality => { :greater_than_or_equal_to => 0 }, :allow_nil => true
  	validates :phone, :allow_nil => true,:allow_blank => true, :numericality => true,:length => { :minimum => 10, :maximum => 15 }
  	validates_format_of :email, :allow_blank => true, :presence => false, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  	private

		def child_invalide(attributes)
			attributes.all? do  |key, value| 
					value.blank?   
			end	
		end
end

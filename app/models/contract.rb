class Contract < ActiveRecord::Base
	belongs_to :client
	has_many :sows, dependent: :destroy, :order => "id", :conditions => ["deleted is null"]
	has_many :contractfiles, dependent: :destroy,:order => "id"
	has_many :ca_files, dependent: :destroy,:order => "id"
	
	accepts_nested_attributes_for :contractfiles, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :ca_files, :reject_if => :child_invalide,:allow_destroy => true 
	accepts_nested_attributes_for :sows,:allow_destroy => true 


	validates :client_id, presence: true
	validates_presence_of :contractfiles, :if => :is_normal_contract?

	def version
		v = 0
		if contractfiles.empty? ||  contractfiles.count == 0
			v
		else
			Contractfile.find(:all, :conditions =>{:contract_id => self.id }).each do |c|
				v = c.version.to_i if c.version.to_i > v
			end
			v
		end
	end

	def ca_version
		v = 0
		if ca_files.empty? ||  ca_files.count == 0
			v
		else
			CaFile.find(:all, :conditions =>{:contract_id => self.id }).each do |c|
				v = c.version.to_i if c.version.to_i > v
			end
			v
		end
	end

	def product_list
		pl = ''
		 sows.each do |s| 
		 	pl << Product.find(s.product_id).name.upcase << " "
		 end
		if pl.empty?
			pl = "N/A"
		end
		pl
	end

	private

		def child_invalide(attributes)
			attributes.all? do  |key, value| 
				if key == 'version'
					true
				else
					value.blank?   
				end
			end	
		end

		def is_normal_contract?
			test != true
		end
end

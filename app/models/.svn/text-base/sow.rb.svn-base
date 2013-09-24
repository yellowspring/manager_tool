class Sow < ActiveRecord::Base
	
	
	has_many :autointel_rates, dependent: :destroy,:order => "id"
	has_many :sow_files, dependent: :destroy,:order => "id"
	has_many :charity_rates, dependent: :destroy,:order => "id"
	has_many :payment_rates, dependent: :destroy,:order => "id"
	has_many :payorintel_rates, dependent: :destroy,:order => "id"
	belongs_to :contract
	 
	validates :product_id, presence:true
	 

	validates_presence_of :sow_files
	validates_presence_of :payorintel_rates, :if => :is_payorintel?
	validates_presence_of :payment_rates, :if => :is_payment?
	validates_presence_of :charity_rates, :if => :is_charity?
	validates_presence_of :autointel_rates, :if => :is_autointel?
	
	
 
	accepts_nested_attributes_for :sow_files,  :allow_destroy => true 
	accepts_nested_attributes_for :autointel_rates, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :charity_rates, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :payment_rates,  :reject_if => :child_invalide,:allow_destroy => true 
	accepts_nested_attributes_for :payorintel_rates, :reject_if => :child_invalide, :allow_destroy => true 


	def version
		v = 0
		if sow_files.empty? ||  sow_files.count == 0
			v
		else 
			SowFile.find(:all, :conditions =>{:sow_id => self.id }).each do |s|
				v = s.version.to_i if s.version.to_i > v
			end
			v
		end
	end

	def product
		Product.find(product_id).name.upcase  
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

		def is_payorintel?
			 
  			if Product.find(product_id).name.upcase == 'PAYORINTEL'
  				true
  			else
  				false
  			end
		end

		def is_payment?
  			if Product.find(product_id).name.upcase =~ /PAYMENT/
  				true
  			else
  				false
  			end
		end

		def is_charity?
  			if Product.find(product_id).name.upcase =~ /CHARITY/
  				true
  			else
  				false
  			end
		end

		def is_autointel?
  			if Product.find(product_id).name.upcase =~ /AUTOINTEL/
  				true
  			else
  				false
  			end
		end

end

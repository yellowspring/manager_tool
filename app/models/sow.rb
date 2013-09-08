class Sow < ActiveRecord::Base
	has_many :sow_details, dependent: :destroy
	has_many :sow_files, dependent: :destroy
	has_many :autointel_rates, dependent: :destroy
	has_many :charity_rates, dependent: :destroy
	has_many :payment_rates, dependent: :destroy
	has_many :payorintel_rates, dependent: :destroy
	belongs_to :contract


	validates :product_id, presence:true
	validates :sow_files, presence:true
	validates_presence_of :payorintel_rates, :if => :is_payorintel?
	validates_presence_of :payment_rates, :if => :is_payment?
	validates_presence_of :charity_rates, :if => :is_charity?
	validates_presence_of :autointel_rates, :if => :is_autointel?
	
 
	accepts_nested_attributes_for :sow_files, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :autointel_rates, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :charity_rates, :reject_if => :child_invalide, :allow_destroy => true 
	accepts_nested_attributes_for :payment_rates,  :reject_if => :child_invalide,:allow_destroy => true 
	accepts_nested_attributes_for :payorintel_rates, :reject_if => :child_invalide, :allow_destroy => true 


	def version
		sow_files.count
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

class Sow < ActiveRecord::Base
	has_many :sow_details, dependent: :destroy
	has_many :sow_files, dependent: :destroy
	has_many :autointel_rates, dependent: :destroy
	has_many :charity_rates, dependent: :destroy
	has_many :payment_rates, dependent: :destroy
	has_many :payorintel_rates, dependent: :destroy
	belongs_to :contract
	
	accepts_nested_attributes_for :sow_details, :allow_destroy => true 
	accepts_nested_attributes_for :sow_files, :allow_destroy => true 
	accepts_nested_attributes_for :autointel_rates, :allow_destroy => true 
	accepts_nested_attributes_for :charity_rates, :allow_destroy => true 
	accepts_nested_attributes_for :payment_rates, :allow_destroy => true 
	accepts_nested_attributes_for :payorintel_rates, :allow_destroy => true 


	validates :product_id, presence: true


	def version
		sow_files.count
	end

	def product
		Product.find(product_id).name.upcase  
	end
end

class Sow < ActiveRecord::Base
	has_many :sow_details, dependent: :destroy
	belongs_to :contract
	
	accepts_nested_attributes_for :sow_details, :allow_destroy => true 


	validates :product_id, presence: true


	def product
		Product.find(product_id).name.upcase  
	end
end

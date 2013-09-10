class Contract < ActiveRecord::Base
	belongs_to :client
	has_many :sows, dependent: :destroy
	has_many :contractfiles, dependent: :destroy
	has_many :ca_files, dependent: :destroy
	
	accepts_nested_attributes_for :contractfiles,:allow_destroy => true 
	accepts_nested_attributes_for :ca_files, :reject_if => :child_invalide,:allow_destroy => true 
	accepts_nested_attributes_for :sows,:allow_destroy => true 


	validates :client_id, presence: true

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
					value.blank?   
			end	
		end
end

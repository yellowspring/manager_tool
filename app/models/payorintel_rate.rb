class PayorintelRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :maintype, :subtype, :term, :commercial, :medicare, :medicaid, :global
	validate :check_consistency

	 validates_numericality_of :commercial, :on => :create, :allow_nil => true
	 validates_numericality_of :medicare, :on => :create, :allow_nil => true
	 validates_numericality_of :medicaid, :on => :create, :allow_nil => true
	 validates_numericality_of :global, :on => :create, :allow_nil => true

	 private
	 	def check_consistency
	 		if commercial.blank? and medicare.blank? and medicaid.blank? and global.blank?
	 			errors.add(:value, 'commercial, medicaid, medicare and global cannot be all blank')
	 			false
	 		else
	 			true
	 		end
	 	end
end

class PayorintelRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :maintype, :subtype, :term, :commercial, :medicare, :medicaid, :global
end

class PayorintelRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :maintype, :maintype, :term, :commercial, :medicare, :medicaid, :global
end

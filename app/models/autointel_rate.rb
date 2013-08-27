class AutointelRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :state, :rate, :term, :maintype, :dummyfield
  
	attr_accessor :dummyfield
end

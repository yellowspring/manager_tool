class CharityRate < ActiveRecord::Base
	belongs_to :sow
	attr_accessible :sow_id, :version, :transaction_fee, :subscription_fee, :term
end

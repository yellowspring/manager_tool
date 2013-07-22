class Sow < ActiveRecord::Base
	has_many :sow_details, dependent: :destroy
	has_one  :sow_detail_template, dependent: :destroy
	belongs_to :contract
end

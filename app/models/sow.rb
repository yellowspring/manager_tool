class Sow < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper
	has_many :sow_details, dependent: :destroy
	has_one  :sow_detail_template, dependent: :destroy
	belongs_to :contract
end

class Contract < ActiveRecord::Base
	belongs_to :client
	has_many :sows, dependent: :destroy
	has_many :contractfiles, dependent: :destroy
	
	accepts_nested_attributes_for :contractfiles


	validates :client_id, presence: true
end

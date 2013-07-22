class Contract < ActiveRecord::Base
	belongs_to :client
	has_many :sows, dependent: :destroy
end

class Contract < ActiveRecord::Base
	belongs_to :client
	has_many :sows, dependent: :destroy
	has_many :sales, dependent: :destroy
	has_many :salespeople, through: :sales

	validates :client_id, presence: true
	validates :salesperson_ids, presence: true
end

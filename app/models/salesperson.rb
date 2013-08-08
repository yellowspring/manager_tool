class Salesperson < ActiveRecord::Base
	has_many :sales, dependent: :destroy
	has_many :clients, through: :sales 
end
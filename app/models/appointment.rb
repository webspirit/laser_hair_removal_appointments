class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :area
	validates :client, :price, presence: true
end
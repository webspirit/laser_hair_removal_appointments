class Appointment < ActiveRecord::Base
	belongs_to :client
	validates :client, :price, presence: true
end
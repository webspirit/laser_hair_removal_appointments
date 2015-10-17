class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :area
	validates :client, :price, :area, :date, presence: true
end
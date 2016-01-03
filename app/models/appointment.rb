class Appointment < ActiveRecord::Base
	belongs_to :client
	has_many :appointment_areas
	has_many :areas, through: :appointment_areas
	accepts_nested_attributes_for :appointment_areas

	validates :client, :price, :date, presence: true
end

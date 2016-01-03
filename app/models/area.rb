class Area < ActiveRecord::Base
	has_many :appointment_areas
	has_many :appointments, through: :appointment_areas
	
	validates :name, presence: true, uniqueness: true
end
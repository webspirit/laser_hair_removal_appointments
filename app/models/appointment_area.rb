class AppointmentArea < ActiveRecord::Base
	belongs_to :appointment
	belongs_to :area

	accepts_nested_attributes_for :area
end

require 'test_helper'
 
class AppointmentTest < ActiveSupport::TestCase
	test "should not save appointment without client_id" do
		appointment = Appointment.new
		assert_not appointment.save, "Saved the appointment without a client_id"
	end

	test "appointment attributes must not be empty" do
		appointment = Appointment.new
		assert appointment.invalid?
		assert appointment.errors[:price].any?
		assert appointment.errors[:client_id].any?
	end

	test "appointment passes validations" do
		appointment = Appointment.new(client_id: 1, price: 10.50)
		assert appointment.valid?
		assert appointment.errors[:client_id].empty?
		assert appointment.errors[:price].empty?
	end
end


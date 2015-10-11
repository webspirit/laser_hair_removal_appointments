require 'test_helper'
 
class SessionTest < ActiveSupport::TestCase
	test "should not save session without client_id" do
		session = Session.new
		assert_not session.save, "Saved the session without a client_id"
	end

	test "session attributes must not be empty" do
		session = Session.new
		assert session.invalid?
		assert session.errors[:price].any?
		assert session.errors[:client_id].any?
	end

	test "session passes validations" do
		session = Session.new(client_id: 1, price: 10.50)
		assert session.valid?
		assert session.errors[:client_id].empty?
		assert session.errors[:price].empty?
	end
end


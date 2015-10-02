require 'test_helper'
 
class SessionTest < ActiveSupport::TestCase
	test "should not save session without client_id" do
		session = Session.new
		assert_not session.save, "Saved the session without a client_id"
	end
end


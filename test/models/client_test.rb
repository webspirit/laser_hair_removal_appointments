require 'test_helper'
 
class ClientTest < ActiveSupport::TestCase
	test "client attributes must not be empty" do
		client = Client.new
		assert client.invalid?
		assert client.errors[:first_name].any?
		assert client.errors[:last_name].any?
	end

	test "client passes validations" do
		client = Client.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
		assert client.valid?
		assert client.errors[:first_name].empty?
		assert client.errors[:last_name].empty?
	end
end


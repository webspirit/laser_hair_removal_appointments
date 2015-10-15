class Client < ActiveRecord::Base
	has_many :appointments
	validates :first_name, :last_name, presence: true
end
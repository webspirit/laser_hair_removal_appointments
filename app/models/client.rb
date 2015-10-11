class Client < ActiveRecord::Base
	has_many :sessions
	validates :first_name, :last_name, presence: true
end
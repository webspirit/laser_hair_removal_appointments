class Area < ActiveRecord::Base
	has_many :appointments
	validates :name, presence: true, uniqueness: true
end
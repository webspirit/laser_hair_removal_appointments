class Client < ActiveRecord::Base
	has_many :appointments, dependent: :destroy
	validates :first_name, :last_name, presence: true

	before_save :compose_full_name

	def compose_full_name
		self.full_name = ([self.first_name, self.last_name] - ['']).compact.join(' ')
	end
end
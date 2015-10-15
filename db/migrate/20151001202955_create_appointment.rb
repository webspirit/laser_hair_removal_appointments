class CreateAppointment < ActiveRecord::Migration
	def change
		create_table :appointments do |t|
			t.decimal :price, precision: 8, scale: 2
			t.timestamps null: false
		end

		add_reference :appointments, :client, index: true, foreign_key: true
	end
end
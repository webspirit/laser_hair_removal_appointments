class CreateAppointment < ActiveRecord::Migration
	def change
		create_table :appointments do |t|
			t.decimal :price, precision: 8, scale: 2
			t.date :date
			t.timestamps null: false
			t.text :notes
		end

		add_reference :appointments, :client, index: true, foreign_key: true
	end
end
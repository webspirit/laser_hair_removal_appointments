class CreateSession < ActiveRecord::Migration
	def change
		create_table :sessions do |t|
			t.decimal :price, precision: 8, scale: 2
			t.timestamps null: false
		end

		add_reference :sessions, :client, index: true, foreign_key: true
	end
end
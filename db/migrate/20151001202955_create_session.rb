class CreateSession < ActiveRecord::Migration
	def change
		create_table :sessions do |t|
			t.timestamps null: false
		end

		add_reference :sessions, :client, index: true, foreign_key: true
	end
end
class CreateClients < ActiveRecord::Migration
	def change
		create_table :clients do |t|
			t.string :first_name, :last_name, null: false
			t.timestamps null: false
		end
	end
end
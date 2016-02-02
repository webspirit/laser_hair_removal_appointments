class AddFullFaceToArea < ActiveRecord::Migration
	def up
		Area.create(name: 'Full face')
	end

	def down
		Area.find_by_name("Full face").destroy
	end
end
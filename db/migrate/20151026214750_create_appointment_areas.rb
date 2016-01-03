class CreateAppointmentAreas < ActiveRecord::Migration
  def change
    create_table :appointment_areas do |t|
      t.integer :appointment_id
      t.integer :area_id
    end
    add_index :appointment_areas, :appointment_id
    add_index :appointment_areas, :area_id
  end
end

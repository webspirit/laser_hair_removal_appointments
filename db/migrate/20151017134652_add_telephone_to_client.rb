class AddTelephoneToClient < ActiveRecord::Migration
  def change
    add_column :clients, :telephone, :string
  end
end

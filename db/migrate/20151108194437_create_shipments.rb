class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.date :delivery_date
      t.integer :storage_number
      t.timestamps null: false
    end
  end
end

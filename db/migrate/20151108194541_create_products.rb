class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.decimal  :value
      t.belongs_to :shipment, index: true

      t.timestamps null: false
    end
  end
end

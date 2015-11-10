class AddStorageRefToShipments < ActiveRecord::Migration
  def change
    add_reference :shipments, :storage, index: true, foreign_key: true
  end
end

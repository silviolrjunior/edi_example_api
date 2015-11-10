class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :number
      t.string :address

      t.timestamps null: false
    end
  end
end

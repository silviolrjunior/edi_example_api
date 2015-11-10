class Shipment < ActiveRecord::Base
  has_many :products
  belongs_to :storage
end

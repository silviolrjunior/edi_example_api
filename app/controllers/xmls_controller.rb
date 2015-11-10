class XmlsController < ApplicationController

  def create
    @total_value = 0
    hash = Hash.from_xml(request.body)
    shipment = hash["Shipment"]
    products = shipment.delete("products")
    build_shipment(shipment)
    build_products(products)

     Storage.all.order(:rule).each do |storage|
      if(storage.rule > @total_value)
        @storage = storage
        break
      end
    end

    @storage = Storage.all.order(:rule).last if @storage.nil? # if pass the higher deposit limit 

    @shipment.storage_number = @storage.id
    @shipment.storage = @storage
    @shipment.save
    render xml: @storage, root: "storage"
  end

  private

  def delete_attr(resource)
    resource.delete("id")
    resource.delete("update_at")
    resource.delete("created_at")    
  end

  def build_shipment(shipment)
    delete_attr(shipment)    
    @shipment = Shipment.create(shipment)
  end

  def build_products(products)
    products.each do |product|
      delete_attr(product)
      product["shipment_id"] = @shipment.id
      @total_value += product["value"].to_f
      Product.create(product)
    end
  end
end

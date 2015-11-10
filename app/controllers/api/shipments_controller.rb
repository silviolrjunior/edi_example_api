class Api::ShipmentsController < ApplicationController
  before_action :find_shipment, only: [:show, :destroy]

  def index
    @shipments = []
    Shipment.all.each do |shipment|
      @shipments.push(shipment)
    end
    render json: { shipment: @shipments }
  end

  def show
    render json: { shipment: @shipment }
  end

  def create
    @shipment = Shipment.create(shipment_params)
    render json: {shipment: @shipment}, status: 201
  end

  def destroy
    render json: {shipment: @shipment.destroy}
  end

  private

  def find_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit(:delivery_date, :storage_number)
  end
end

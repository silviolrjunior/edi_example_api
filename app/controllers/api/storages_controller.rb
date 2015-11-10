class Api::StoragesController < ApplicationController
  before_action :find_storage, only: [:show, :destroy]

  def index
    @storages = []
    Storage.all.each do |storage|
      @storages.push(storage)
    end
    render json: { storage: @storages }
  end

  def show
    render json: { storage: @storage }
  end

  def create
    @storage = Storage.create(storage_params)
    render json: {storage: @storage}, status: 201
  end

  def destroy
    render json: {storage: @storage.destroy}
  end

  private

  def find_storage
    @storage = Storage.find(params[:id])
  end

  def storage_params
    params.require(:storage).permit(:number, :address, :rule)
  end
end

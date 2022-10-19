class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: {locations: ActiveModel::Serializer::CollectionSerializer.new(@locations, each_serializer: LocationSerializer)}
  end

  def create
    @new_location = Location.create(name: params[:name], address: params[:address], latitude: params[:lat], longitude: params[:lng])
    render json: @new_location, serializer: LocationSerializer
  end
end

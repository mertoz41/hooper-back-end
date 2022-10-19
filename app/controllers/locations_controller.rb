class LocationsController < ApplicationController
  # skip_before_action :authorized
  def index
    @locations = Location.all
    render json: {locations: ActiveModel::Serializer::CollectionSerializer.new(@locations, each_serializer: LocationSerializer)}
  end
end

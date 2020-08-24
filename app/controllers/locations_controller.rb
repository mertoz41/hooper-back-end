class LocationsController < ApplicationController
  # skip_before_action :authorized
  def index
    locations = Location.all
    render json: locations, include: :postings
  end
end

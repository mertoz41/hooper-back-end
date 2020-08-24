class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]  changed to have access to all users without authentication
  # skip_before_action :authorized 

  def index
    users = User.all 
    render json: users.to_json( include: [:taught, :taught_by])
  end 

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end 

  def show
    user = User.find(params["id"])
    render json: user.to_json( include: [:taught, :taught_by])
    
  end 

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else 
      render json: { error: 'Username already exists' }, status: :not_acceptable
    end 

  end 


  private
  def user_params
    params.require(:user).permit(:username, :password, :picture)
  end 

end

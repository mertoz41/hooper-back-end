class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create] 

  def index
    users = User.all 
    render json: users.to_json( include: [:taught, :taught_by])
  end 

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end 

  def show
    @user = User.find(params["id"])
    render json: @user, serializer: UserSerializer
  end 

  def search
    @users = User.where("lower(username) like?", "%#{params[:name].downcase}%")
    render json: @users, each_serializer: UserSerializer
  end

  def create
    user = User.create(username: params[:username], password: params[:password], position: params[:position], height: params[:height], plays_like: params[:plays_like])
    if user.valid?
      if params[:avatar]
        user.avatar.attach(params[:avatar])
      end
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else 
      render json: { errors: user.errors.messages[:username] }
    end 

  end 


end

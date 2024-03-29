class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = {user_id: @user.id}
      token = encode(payload)
      
      render json: { 
        user_data: UserSerializer.new(@user),
        token: token
      }
    else
      render json: { message: 'Invalid username or password' }
    end 

  end

  def checking
    token = request.headers["Authorization"].split(' ')[1]
    @user = User.find(decode(token)["user_id"])
    render json: @user, serializer: UserSerializer
  end 
end

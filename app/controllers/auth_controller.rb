class AuthController < ApplicationController

  def create
    
    user = User.find_by(username: params[:username])
    
    
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode(payload)
      
      render json: { 
        user_data: user.as_json({:except => [:password_digest]}),
        token: token
      }
    else
      render json: { message: 'Invalid username or password' }
    end 

  end

  def checking
    user = User.find(decode(request.headers["Authentication"])["user_id"])
    render json: {user: user.as_json({:except => [:password_digest]})}
    

  end 
end

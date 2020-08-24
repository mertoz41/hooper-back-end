class ApplicationController < ActionController::API
    # before_action :authorized
    def encode(payload)
        JWT.encode(payload, 'experiment', 'HS256')
    end 

    # def auth_header
    #     request.headers["Authorization"]
    # end 

    def decode(token)
         JWT.decode(token, 'experiment', true, {algorithm: 'HS256'})[0]
    end 

    # def current_user
    #     if decoded_token
    #         user_id = decoded_token[0]['user_id']
    #         @user = User.find_by(id: user_id)
    #     end 
    # end 

    # def logged_in?
    #     !!current_user
    # end 
    
    # def authorized
    #     render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    # end 
            


end 
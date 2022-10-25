class ApplicationController < ActionController::API
    before_action :cors_set_access_control_headers, :authorized
    def encode(payload)
        JWT.encode(payload, 'experiment', 'HS256')
    end 

    def auth_header
        request.headers["Authorization"]
    end 

    def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, 'experiment', true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
    end
    def decode(token)
         JWT.decode(token, 'experiment', true, {algorithm: 'HS256'})[0]
    end 

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end 
    end 

    def logged_in?
        !!current_user
    end 
    
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

    def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
            


end 
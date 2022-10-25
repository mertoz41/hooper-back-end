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

    def cors_preflight_check
        if request.method == 'OPTIONS'
          cors_set_access_control_headers
          render text: '', content_type: 'text/plain'
        end
      end
    def cors_set_access_control_headers
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
        response.headers['Access-Control-Max-Age'] = '1728000'
    end
            


end 
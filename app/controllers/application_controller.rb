class ApplicationController < ActionController::API
    require 'jwt'

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decode_token
        # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTAifQ.mqnFcbPSHIZBIATXHlRbu-qbwW9dny36cnXmujI0Gao (header exampl!)
        #auth_header = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTAifQ.mqnFcbPSHIZBIATXHlRbu-qbwW9dny36cnXmujI0Gao"
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin 
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def authorized_user
        decoded_token = decode_token()
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorized_admin
        decoded_token = decode_token()
        if decoded_token
            admin_id = decoded_token[0]['admin_id']
            @admin = Admin.find_by(id: admin_id)
        end
    end

    def authorizeAdmin 
        render json: { message: 'You have to log in.'}, status: 401 unless
        authorized_admin
    end

    def authorize
        render json: { message: 'You have to log in.' }, status: 401 unless
        authorized_user
    end
    
    def signout

    end

end 
class ApplicationController < ActionController::API
    require 'jwt'

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decode_token
        # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTAifQ.mqnFcbPSHIZBIATXHlRbu-qbwW9dny36cnXmujI0Gao (header exampl!)
        auth_header = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTAifQ.mqnFcbPSHIZBIATXHlRbu-qbwW9dny36cnXmujI0Gao"
        #auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin 
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

end
s
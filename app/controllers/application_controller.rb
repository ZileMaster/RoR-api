class ApplicationController < ActionController::API
    require 'jwt'

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end
end

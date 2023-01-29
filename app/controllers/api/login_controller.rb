class Api::LoginController < ApplicationController
    def login
        admin = Admin.find_by(username: params[:username])
        user = User.find_by(username: params[:username])
        
        if admin && admin.authenticate(params[:password])
            payload = { id: admin.id, username: admin.username, role: 'admin' }
            token = JWT.encode(payload)
    
            render json: { token: token }, status: :created
        elsif user && user.authenticate(params[:password])
            payload = { id: user.id, username: user.username, role: 'user' }
            token = JWT.encode(payload)
    
            render json: { token: token }, status: :created
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end
end
    
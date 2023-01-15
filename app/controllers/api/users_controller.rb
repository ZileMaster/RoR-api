class Api::UsersController < ApplicationController
    before_action :authorizeAdmin, only:[:destroy, :index]
    #before_action :authorize, only:[:destroy]
    
    # GET /users
    def index 
        @users = User.all
        render json: @users
    end

    # get /user/:id
    def show 
        @user = User.find_by(username: user_params[:username])
        if @user.nil?
            render json: { message: 'User not found. '}, status: :not_found
        else
            if @user.errors.empty?
                if @user && @user.authenticate(user_params[:password])
                    token = encode_token({ user_id: @user.id})
                    render json: ({user: @user, token: token}), status: 200
                else
                    render json: { message: 'Incorect username or password'}, status: 400
                end
            else
                render json: { message: 'Incorect username or password'}, status: 400
            end
        end
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.errors.empty?
            if @user.save
                token = encode_token({ user_id: @user.id })
                render json: { user: @user, token: token}, status: 200 
            else
                render json: { message: 'unable to make user'}, status: 400
            end
        else 
            render json: { message: 'Make sure none field is empty, or the username/email is taken.' };
        end
    end

    #put /users/:id
    def update 
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: { message: 'user successfully updated' }, status: 200
        else
            render json: { error: 'unable to make user'}, status: 400
        end
    end

     #delete /users/:id
    def destroy 
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: { message: 'user successfully destroyed' }, status: 200
        else
            render json: { error: 'unable to make user'}, status: 400
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password , :first_name, :last_name, :email, :admin_id)
    end

end

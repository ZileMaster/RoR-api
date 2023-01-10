class Api::UsersController < ApplicationController
    # GET /users
    def index 
        @users = User.all
        render json: @users
    end

    # get /user/:id
    def show 
        @user = User.find_by(username: user_params[:username])

            if @user && @user.authenticate(user_params[:password])
                token = encode_token({ user_id: @user.id})
                render json: ({user: @user, token: token}), status: 200
            else
                render error: { error: 'unable to make user'}, status: 400
            end
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, token: token}, status: 200 
        else
            render error: { error: 'unable to make user'}, status: 400
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

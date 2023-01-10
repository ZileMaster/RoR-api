class Api::UsersController < ApplicationController
    # GET /users
    def index 
        @users = User.all
        render json: @users
    end

    # get /user/:id
    def show 
        @user = User.find(params[:id])
        render json: @user
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
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
        params.require(:user).permit(:username, :password )
    end

end

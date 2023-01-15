class Api::AdminsController < ApplicationController
    
    # GET /admins
    def index 
        @admins = Admin.all
        render json: @admins
    end

    # "username": "mainAdmin1",
    # "password": "MyNewPassword1",

    # get /admin/:id
    def show 
        @admin = Admin.find_by(username: admin_params[:username])
        if @admin.nil?
            render json: { message: 'Admin not found.'}, status: :not_found
        else 
            if @admin.errors.empty? 
                if @admin && @admin.authenticate(admin_params[:password])
                    token = encode_token({ admin_id: @admin.id})
                    render json: {admin: @admin, token: token}, status: 200
                else
                    render json: { message: 'Incorect username or password'}, status: 400
                end
            else
                render json: { message: 'Incorect username or password'}, status: 400
            end
        end
    end

    # POST /admins
    def create
        @admin = Admin.new(admin_params)
        if @admin.errors.empty?    
            if @admin.save
                token = encode_token({ admin_id: @admin.id })
                render json: { admin: @admin, token: token}, status: 200 
            else
                render json: { message: 'unable to make admin'}, status: 400
            end
        else
            render json: { message: 'Make sure none field is empty, or the username/email is taken.' };
        end
    end

    #put /admins/:id
    def update 
        @admin = Admin.find(params[:id])
        if @admin
            @admin.update(admin_params)
            render json: { message: 'user successfully updated' }, status: 200
        else
            render json: { error: 'unable to make admin'}, status: 400
        end
    end

     #delete /admins/:id
     def destroy 
        @admin = Admin.find(params[:id])
        if @admin
            @admin.destroy
            render json: { message: 'user successfully destroyed' }, status: 200
        else
            render json: { error: 'unable to make admin'}, status: 400
        end
    end

    private 

    def admin_params
        params.require(:user).permit(:username, :password , :first_name, :last_name, :email, )
    end

end

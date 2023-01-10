class Api::AdminsController < ApplicationController
    
    # GET /admins
    def index 
        @admins = Admin.all
        render json: @admins
    end

    # get /admin/:id
    def show 
        @admin = Admin.find_by(username: admin_params[:username])

            if @admin && @admin.authenticate(admin_params[:password])
                token = encode_token({ admin_id: @admin.id})
                render json: ({admin: @admin, token: token}), status: 200
            else
                render error: { error: 'unable to make user'}, status: 400
            end
    end

    # POST /admins
    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            token = encode_token({ admin_id: @admin.id })
            render json: { admin: @admin, token: token}, status: 200 
        else
            render error: { error: 'unable to make admin'}, status: 400
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

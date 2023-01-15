class Api::KomentarsController < ApplicationController
    before_action :authorize, only: [:create, :destroy, :update]
    
    def index
        @komentars = Komentar.all
        render json: @komentars
     end

     def show
        @komentar = Komentar.where(id: params[:id])
        render json: @komentar
    end
     
     def create
        @komentar = Komentar.new(komentar_params)
        if @komentar.errors.empty?
            if @komentar.save 
                render json: { message: "The comment has been successfully created."}, status: 200
            else
                render json: { message: "Comment not created."}, status: 400
            end
        else
            render json: { message: 'Be sure to fill all the fields.' }, status: 400
        end
    end

    def destroy
        @komentar = Komentar.find(params[:id])
        if @komentar
            @komentar.destroy
            render json: { message: 'Comment destroyed'}, status: 200
        else
            render json: { message: 'Comment not destroyed'}, status: 400;
        end
    end

    def update 
        @komentar = Komentar.find(params[:id])
        if @komentar && @komentar.errors.empty?
            @komentar.update(komentar_params)
            render json: { message: 'info successfully updated' }, status: 200
        else
            render json: { message: 'Unable to update comment.'}, status: 400
        end
    end

    private 

    def komentar_params
      params.require(:komentar).permit(:user_id, :description, :headline, :post_id, :rating)
    end
end

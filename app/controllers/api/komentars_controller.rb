class Api::KomentarsController < ApplicationController
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
        if @komentar.save 
            render json: { message: "The information has been successfully made!"}, status: 200
        else
            render json: { error: "information not created"}, status: 400
        end
    end

    def destroy
        @komentar = Komentar.where(id: params[:id])
        if @komentar
            @komentar.destroy
            render json: { message: 'info destroyed'}, status: 200
        else
            render json: { error: 'info not destroyed'}, status: 400;
        end
    end

    def update 
        @komentar = Komentar.find(params[:id])
        if @komentar
            @komentar.update(komentar_params)
            render json: { message: 'info successfully updated' }, status: 200
        else
            render json: { error: 'unable to update info'}, status: 400
        end
    end

    private 

    def komentar_params
      params.require(:komentar).permit(:user_id, :description, :headline, :post_id, :rating)
    end
end

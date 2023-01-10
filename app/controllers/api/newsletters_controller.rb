class Api::NewslettersController < ApplicationController
    def index
        @newsletters = Newsletter.all
        render json: @newsletter
     end

     def show
        @newsletter = Newsletter.where(id: params[:id])
        render json: @newsletter
    end
     
     def create
        @newsletter = Newsletter.new(news_params)
        if @newsletter.save 
            render json: { message: "The information has been successfully made!"}, status: 200
        else
            render json: { error: "information not created"}, status: 400
        end
    end

    def destroy
        @newsletter = Newsletter.where(id: params[:id])
        if @newsletter
            @newsletter.destroy
            render json: { message: 'info destroyed'}, status: 200
        else
            render json: { error: 'info not destroyed'}, status: 400;
        end
    end

    def update 
        @newsletter = Newsletter.find(params[:id])
        if @newsletter
            @newsletter.update(news_params)
            render json: { message: 'info successfully updated' }, status: 200
        else
            render json: { error: 'unable to update info'}, status: 400
        end
    end

    private 

    def news_params
      params.require(:newsletter).permit(:user_id)
    end
end

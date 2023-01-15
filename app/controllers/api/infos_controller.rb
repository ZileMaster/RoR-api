class Api::InfosController < ApplicationController
    before_action :authorizeAdmin, only:[:create, :update, :destroy]

    def index
        @infos = Info.all
        render json: @infos
     end

     def show
        @info = Info.where(id: params[:id])
        render json: @info
    end
     
     def create
        @info = Info.new(info_params)
        if @info.save && @info.errors.empty?
            render json: { message: "The information has been successfully made!"}, status: 200
        else
            render json: { error: "information not created"}, status: 400
        end
    end

    def destroy
        @info = Info.where(id: params[:id])
        if @info
            @info.destroy
            render json: { message: 'info destroyed'}, status: 200
        else
            render json: { error: 'info not destroyed'}, status: 400;
        end
    end

    def update 
        @info = Info.find(params[:id])
        if @info && info.errors.empty?
            @info.update(info_params)
            render json: { message: 'info successfully updated' }, status: 200
        else
            render json: { error: 'unable to update info'}, status: 400
        end
    end

    private 

    def info_params
      params.require(:info).permit(:head, :description, :notice_board_id)
    end
end

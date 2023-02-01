class Api::PostsController < ApplicationController

    def show
        @post = Post.where(id: params[:id]).first
        render json: @post
    end
    
end
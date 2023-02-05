class Api::PostsController < ApplicationController

    def show
        @post = Post.where(id: params[:id]).first
        @komentars = Komentar.where(post_id: @post.id)
        render json: 
        {
            post: @post, 
            comments: @komentars.as_json
        }
    end
    
end
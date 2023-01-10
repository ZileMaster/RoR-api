class Api::PersonalBlogsController < ApplicationController

    def index
        @projects_posts = Post.where(topic: "personal")
        render json: @projects_posts
     end
     
     def create
        @post = Post.new(post_params)
        if @post 
            render json: { message: "Post has been successfully made!"}, status 200
        else
            render json: { error: "post not creates"}, status 400

    def destroy
        @post = Post.find(params[:id])
        if @post
            @post.destroy
            render json: { message: 'post destroyed'}, status 200
        else
            render json: { error: 'post not destroyed'}, status 400;
        end
    end

    def update 
        @post = Post.find(params[:id])
        if @post
            @post.update(post_params)
            render json: { message: 'post successfully updated' }, status: 200
        else
            render json: { error: 'unable to make post'}, status: 400
        end
    end

    private 

    def post_params
      params.require(:post).permit(:headline, :description)
    end
end

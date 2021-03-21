class PostsController < ApplicationController
 before_action :redirect_if_not_logged_in

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @posts = @user.posts
        else
        @posts = Post.all
        end
    end


    def show
        @post = Post.find_by_id(params[:id])
        redirect_to posts_path if !@post
    end

    def destroy
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

end

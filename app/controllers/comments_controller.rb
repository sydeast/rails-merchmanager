class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comments = @post.comments
        else
            @error = "That post doesn't exist. You are now seeing all comments." if params[:post_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            # @comment = Comment.new(post_id: params[:post_id])
            @comment = @post.comments.build
        else
            @error = "That post doesn't exist. Please select a post to add a comment." if params[:post_id]
            @comment = Comment.new
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to post_path(params[:post_id])
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content,:post_id)
    end
end

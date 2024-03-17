class CommentsController < ApplicationController    
    before_action :authenticate_user!
    before_action :set_post
    
    def create
        # --> set_post
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been successfully created"
            redirect_to post_path(@post)
        else
            flash[:notice] = "Comment has not been successfully created"
            render post_path(@post)
        end

    end

    def destroy
        # -- > set_post
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end


    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end

end
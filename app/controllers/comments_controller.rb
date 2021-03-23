class CommentsController < ApplicationController
    before_action :authenticate_account!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in?
        @post = Post.find(params[:post_id])

        if @comment.save
            create_notification @post, @comment
            redirect_to dashboard_path
        else
            redirect_to dashboard_path
        end    
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to dashboard_path
    end
    
    private
    def comment_params
    params.require(:comment).permit(:comment, :post_id)
    end

    def create_notification(post, comment)
        return if post.account.id == current_account.id 
        Notification.create(
            account_id: post.account.id,
            notified_by_id: current_account.id,
            post_id: post.id,
            identifier: comment.id,
            notice_type: 'comment')
    end
end

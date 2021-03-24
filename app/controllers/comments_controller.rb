class CommentsController < ApplicationController
    before_action :authenticate_account!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in?
        @post = Post.find(params[:post_id])
        request_url= request.referrer
        
        if @comment.save
            create_notification @post, @comment
            if request_url.include?('/dashboard')
                redirect_to dashboard_path 
            else
                redirect_to post_path(@post)
            end
        else
            if request_url.include?('/dashboard')
                redirect_to dashboard_path 
            else
                redirect_to post_path(@post)
            end
        end    
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        request_url= request.referrer
        if request_url.include?('/dashboard')
            redirect_to dashboard_path 
        else
            redirect_to post_path(@post)
        end
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

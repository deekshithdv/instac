class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    def create
        @post = Post.find(params[:post_id])    
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else 
            create_notification @post
            @post.likes.create(account_id: current_account.id)
        end
        
        request_url= request.referrer
        if request_url.include?('/dashboard')
            redirect_to dashboard_path 
        else
            redirect_to post_path(@post)
        end
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        request_url= request.referrer
        if request_url.include?('/dashboard')
            redirect_to dashboard_path 
        else
            redirect_to post_path(@post)
        end
    end

    
    private
    def create_notification(post)
        return if post.account.id == current_account.id 
        Notification.create(
            account_id: post.account.id,
            notified_by_id: current_account.id,
            post_id: post.id,
            identifier: post.id,
            notice_type: 'lik')
    end
    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
    Like.where(account_id: current_account.id, post_id:
    params[:post_id]).exists?
    end

    def find_like
        @like = @post.likes.find(params[:id])
     end
end
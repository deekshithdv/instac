class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @post.likes.create(account_id: current_account.id)
        end
        redirect_to dashboard_path
    end

    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        redirect_to dashboard_path
    end

    
    private
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
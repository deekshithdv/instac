class AccountsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_account, only: [:profile]
    def index
        followers_id = Follower.where(follower_id: current_account.id).map(&:following_id)
        followers_id << current_account.id
        @posts = Post.includes(:account).where(account_id: followers_id)

        following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
        following_ids << current_account.id
        @follower_suggestions = Account.where.not(id: following_ids)
         

      end

    def profile
        #user profile 
            @post = @account.posts.all
            @following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    end

    def follow_account
        follower_id = params[:follow_id]
        if Follower.create!(follower_id: current_account.id, following_id: follower_id)
           flash[:success] = "New following user"
        else
            flash[:danger] = "Unable to follow"
        end
        redirect_to dashboard_path
    end

    def unfollow_account
        follower_id = params[:follow_id]
        if Follower.find_by(follower_id: current_account.id,following_id: follower_id).destroy
        flash[:success] = "success"
        else
        flash[:danger] = "Not able to"
        end
        redirect_to dashboard_path
    end
         
    def set_account
        @account = Account.find(params[:id])
    end
end

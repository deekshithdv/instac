class AccountsController < ApplicationController
    def index
        @posts = current_account.posts.order(created_at: :desc)
      end

    def show
        #user profile
        @posts = current_account.posts.all   
    end

    def edit
     @Account = Account.find(params[:id])
    end

    def update
        current_account.update(user_params)
        redirect_to profile_path
    end

    private
    def user_params
    params.require(:account).permit(:username, :website, :bio, :avatar)
    end

end

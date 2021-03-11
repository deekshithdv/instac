class AccountsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_account, only: [:profile]
    def index
        @posts = current_account.posts.order(created_at: :desc)
      end

    def profile
        #user profile 
            @post = @account.posts.all
    end

    def set_account
        @account = Account.find(params[:id])
    end
end

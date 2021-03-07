class AccountsController < ApplicationController
    def index
        @posts = current_account.posts.order(created_at: :desc)
      end

    def show
        #user profile
        @posts = current_account.posts.all   
    end
end

Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"

  #feed
  get "/dashboard" => "accounts#index"
  resources :posts do
    resources :likes
  end

  #profile
  get "profile/:id"=> "accounts#profile",  as:  :profile
  resources :posts, only: [:new, :create, :show , :destroy]
  
  get "following_accounts" => "accounts#following"
  get "follower_accounts" => "accounts#followers"
  
  post "follow/account" => "accounts#follow_account", as: :follow_account 
  delete "unfollow/account" => "accounts#unfollow_account", as: :unfollow_account 
end

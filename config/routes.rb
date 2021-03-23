Rails.application.routes.draw do
  get 'notifications/link_through'
  devise_for :accounts
  # For details on the DSL available within this, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"

  #feed
  get "/dashboard" => "accounts#index"


  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through

  get 'notifications', to: 'notifications#index'
  # route for likes
  resources :posts do
    resources :likes
    resources :comments
  end

  # comments
  
  # user search
  get '/search' => 'accounts#search', :as => 'search_page'

  #profile
  get "profile/:id"=> "accounts#profile",  as:  :profile
  resources :posts, only: [:new, :create, :show , :destroy]
  

  # follow
  get "following_accounts" => "accounts#following"
  get "follower_accounts" => "accounts#followers"
  
  post "follow/account" => "accounts#follow_account", as: :follow_account 
  delete "unfollow/account" => "accounts#unfollow_account", as: :unfollow_account 
end

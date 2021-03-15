Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"

  #feed
  get "/dashboard" => "accounts#index"

  #profile
  get "profile/:id"=> "accounts#profile",  as:  :profile
  resources :posts, only: [:new, :create, :show , :destroy]
  
  post "follow/account" => "accounts#follow_account", as: :follow_account 
  delete "unfollow/account" => "accounts#unfollow_account", as: :unfollow_account 
end

Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"

  #feed
  get "/dashboard" => "accounts#index"

  #profile
  get "/profile" => "accounts#show"
  resources :posts, only: [:new, :create, :show , :destroy]
  

end

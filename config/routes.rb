Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"

  #feed
  get "/dashboard" => "accounts#index"

end

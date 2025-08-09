Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :index, :show, :edit, :update, :destroy ] do
    resources :posts, only: [ :new, :create, :edit, :update, :destroy ]

    member do
      post "follow"
      post "unfollow"
    end
  end

  resources :posts, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end

Rails.application.routes.draw do
  get "comments/new"
  get "comments/create"
  devise_for :users

  resources :users, only: [ :index, :show, :edit, :update, :destroy ] do
    resources :posts, only: [ :new, :create, :edit, :update, :destroy ]

    member do
      post "follow"
      post "unfollow"
      post "like"
    end
  end

  resources :posts, only: [ :index, :show ] do
    resources :comments, only: [ :create ]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end

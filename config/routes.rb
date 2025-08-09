Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [ :index, :show, :edit, :update, :destroy ] do
    member do
      post "follow"
      post "unfollow"
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end

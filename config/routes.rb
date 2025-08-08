Rails.application.routes.draw do
  resources :users, only: [ :index, :show, :edit, :update, :destroy ]
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end

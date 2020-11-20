Rails.application.routes.draw do
  devise_for :users
  get 'travels/index'
  root to: "travels#index"
  resources :spots do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :catelists, only: :index
  resources :cates, only: :index
  resources :users, only: :show
end
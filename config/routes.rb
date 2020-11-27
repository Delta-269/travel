Rails.application.routes.draw do
  devise_for :users
  get 'travels/index'
  root to: "travels#index"
  resources :spots do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :catelists, only: :index
  resources :cates, only: :index
  resources :users, only: :show
  resources :favos, only: :index
end
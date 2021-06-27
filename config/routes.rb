Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :movies, only: [:create, :index, :show, :edit, :update, :destroy]


end

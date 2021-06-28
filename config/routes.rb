Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :movies, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]

end

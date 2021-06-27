Rails.application.routes.draw do
  get 'homes/about'
  root to: 'homes#top'
  devise_for :users


end

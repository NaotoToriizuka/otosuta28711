Rails.application.routes.draw do
  devise_for :users
  root to: "musics#index"
  resources :musics, only: [:index, :new, :create, :update, :destroy] 
  resources :rooms, only: [:index, :show, :edit]
  get 'musics/search'
end

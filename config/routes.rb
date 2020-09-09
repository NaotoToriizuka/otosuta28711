Rails.application.routes.draw do
  devise_for :users
  root to: "musics#index"
  resources :musics, only: [:index, :new, :create] 
  # get 'musics/room', to: "musics#room"
  resources :rooms, only: [:index, :show]

end

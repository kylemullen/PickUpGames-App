Rails.application.routes.draw do

  devise_for :users

  root 'games#home'

  resources :games
  resources :neighborhoods
  resources :sports
  resources :courts
  resources :parks
  resources :gamed_players
  resources :images

  namespace :api do
    namespace :v1 do
     resources :games
    end
  end

  namespace :api do
    namespace :v1 do
      resources :gamed_players
    end
  end

  namespace :api do
    namespace :v1 do
      resources :parks
    end
  end

end

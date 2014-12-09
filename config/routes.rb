Rails.application.routes.draw do

  devise_for :users

  root 'games#home'

  resources :games
  resources :neighborhoods
  resources :sports
  resources :courts
  resources :parks
  resources :gamed_players

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
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'sports/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'sports/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :sports

  # Example resource route with options:
  #   resources :sports do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :sports do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :sports do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/sports/* to Admin::sportsController
  #     # (app/controllers/admin/sports_controller.rb)
  #     resources :sports
  #   end
end

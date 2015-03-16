Rails.application.routes.draw do

  match 'conversations/notify', to: 'conversations#notify', via: [:get,:post]

  get 'conversations/new_notify', to: 'conversations#new_notify'

  get 'conversations/clear'

  get 'team_rosters/create'

  get 'team_rosters/new'

  get 'team_rosters/remove', to: 'team_rosters#remove'

  get 'tournament_teams/remove', to: 'tournament_teams#remove'

  get 'tournament_attendances/remove', to:'tournament_attendances#remove'

  get 'tournaments/transfer', to:'tournaments#transfer'

  resources :users, :teams, :team_rosters, :tournament_teams, :tournaments, :tournament_attendances

  get 'sessions/create'

  get 'sessions/destroy'

  get 'session/create'

  get 'session/destroy'

  get 'teams/suggestions.json', to: 'teams#load_suggestions'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get 'privacy', to: 'privacy#index'

  get 'main/index'
  root :to => 'main#index'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
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
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
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
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

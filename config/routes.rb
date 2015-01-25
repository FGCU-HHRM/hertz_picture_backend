Rails.application.routes.draw do
  
  resources :products do
    member do
      get 'history'
      get 'rent', to: 'products#prerent'
      post 'rent[/:pic_id]', to: 'products#postrent'
      get 'return', to: 'products#prereturn'
      post 'return[/:pic_id]', to: 'products#postreturn'
    end
    collection do
      get 'search'
    end
  end

  resources :users
  
  get 'new_transaction' => 'transactions#new'
  post 'new_transaction' => 'transactions#create'
  get 'transactions/:id' => 'transactions#show'
  get 'products/:id/new' => 'transactions#initiate', as: :initiate_transaction
  post 'products/:id' => 'transactions#submit', as: :submit_transaction
  # resources :transactions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'transactions#new'

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

Kozenii::Application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :users
  resources :seasons, only: [:index, :show, :update]

  resources :expenses do
    post 'update_comments'
    member do
      get 'comments'
      get 'new_balancer'
      post 'balanced_out'
    end
  end

  resources :comments, only: [:destroy] do
#    delete ':id', to: 'expenses#destroy_comment'
  end
  resources :incomes
  resources :members
  resources :categories
  resource :summary, only: [:show], controller: :summary

  namespace :admin do
    resources :groups, except: [:show]
    resources :link_menus, except: [:show]
    resources :topics, except: [:show]
    resources :budgets
  end

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

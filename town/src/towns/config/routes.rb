
Rails.application.routes.draw do


#constraints subdomain: 'towns' do  
# namespace :api , path: '/'do
#  resources :municipalidades ,only: [:index ,:show]

namespace :api do
  constraints subdomain: /^(?!www)(\w+)/ do
    resources :municipalities   do
      get '/searchevent/:start_date/:end_date' , to:  'search#searchevent'
      resources :municipality_events
      resources :municipality_notices
      resources :delegations
      resources :employees 
    end
    resources :supermarkets do
      resources :supermarket_events 
      resources :supermarket_notices 
    end
    resources :radios do
      resources :radio_events 
      resources :radio_notices 
    end
  end
  resources :users 
  resources :document_types 
  resources :people 
  resources :addresses 
  resources :market_types
end

namespace :api do
  post 'auth/login' => 'auth#login'
  get 'auth/token' => 'auth#get_token'
  resources :countries do
    resources :states do 
      resources :departments do 
        resources :towns  do
          resources :municipalities  do
            get '/searchevent/:start_date/:end_date' , to:  'search#searchevent'
            resources :municipality_events
            resources :municipality_notices
            resources :delegations
            resources :employees                  
          end
          resources :supermarkets do
            resources :supermarket_events
            resources :supermarket_notices
          end
          resources :radios do
            resources :radio_events 
            resources :radio_notices 
          end
        end           
      end
    end
  end
  resources :users
  resources :document_types
  resources :people
  resources :addresses
  resources :market_types
end





  #with_options only: :index do |list_only|
  # list_only.resources :municipalidades
  #end
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

Rails.application.routes.draw do

  scope :api do
    resources :users do
      resources :accesses, :purchases
      post 'access_objects', :to => "users#add_access_object", :as => :add_access_object_to
      get 'access_objects', :to => "users#access_objects", :as => :user_access_objects
      delete 'access_objects/:id', :to => "users#remove_access_object", :as => :remove_user_access_object
      get 'access_objects/:id', :to => "users#access_object", :as => :user_access_object
    end


    scope :me do
      get '/' => 'users#show_me'
      resources :accesses, :purchases
      post 'access_objects', :to => "users#add_access_object", :as => :add_access_object_to
      get 'access_objects', :to => "users#access_objects", :as => :user_access_objects
      delete 'access_objects/:id', :to => "users#remove_access_object", :as => :remove_user_access_object
      get 'access_objects/:id', :to => "users#access_object", :as => :user_access_object
    end

    resources :access_objects do
      get 'accesses', :to => "access_objects#accesses", :as => :access_object_accesses
    end
  end


  root 'admin#index'
  get '/template/:name' => 'admin#template'

  get '*all' => 'admin#index'


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

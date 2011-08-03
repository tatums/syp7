Syp7::Application.routes.draw do


  # get "purchase_orders/index"
  # 
  # get "purchase_orders/show"
  # 
  # get "purchase_orders/new"
  # 
  # get "purchase_orders/create"

	resources :customers, :salespeople, :vendors, :products, :linecodes
	
	resources :orders
	resources :transactions
	resources :orderlines
	resources :lots
	resources :purchase_orders

	resources :days do 
    resources :lots
  end

  # get "transactions/index"
  # 
  # get "transactions/show"
  # 
  # get "transactions/new"
  # 
  # get "transactions/create"
  # 
  # get "salespeople/index"
  # 
  # get "salespeople/show"
  # 
  # get "salespeople/new"
  # 
  # get "salespeople/create"
  # 
  # get "products/index"
  # 
  # get "products/show"
  # 
  # get "products/new"
  # 
  # get "products/create"
  # 
  # get "orders/index"
  # 
  # get "orders/show"
  # 
  # get "orders/new"
  # 
  # get "orders/create"
  # 
  # get "orderlines/index"
  # 
  # get "orderlines/show"
  # 
  # get "orderlines/new"
  # 
  # get "orderlines/create"
  # 
  # get "linecodes/index"
  # 
  # get "linecodes/show"
  # 
  # get "linecodes/new"
  # 
  # get "linecodes/create"
  # 
  # get "customers/index"
  # 
  # get "customers/show"
  # 
  # get "customers/new"
  # 
  # get "customers/create"
  
  # get "vendors/index"
  # 
  # get "vendors/show"
  # 
  # get "vendors/new"
  # 
  # get "vendors/create"

  # get "lots/index"
  # 
  # get "lots/show"
  # 
  # get "lots/new"

  # get "day/index"
  # 
  # get "day/show"




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "customers#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

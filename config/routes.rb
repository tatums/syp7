Syp7::Application.routes.draw do


  get "months/index"
  get "months/show"

  get "years/index"


	resources :orders
	resources :orderlines
	
	
	resources :purchase_orders 
  resources :purchase_order_lines

	resources :salespeople, :linecodes, :assemblers

	resources :transactions
  resources :product_histories
  
  resources :products do 
    resources :product_histories, :shallow => true
    resources :transactions, :shallow => true
  end

	resources :lots do 
	  resources :product_histories, :shallow => true
	  resources :transactions, :shallow => true
	end


  resources :customers do 
    resources :product_histories, :shallow => true
  	resources :orders, :shallow => true
  end  
  
	
  resources :vendors do
    resources :transactions
    resources :purchase_orders
  end


  resources :years do
    resources :months do
      resources :days
    end
  end
  

	resources :days do 
    resources :lots, :shallow => true
  	resources :orders, :shallow => true
  	resources :transactions, :shallow => true
  	resources :purchase_orders, :shallow => true
  	resources :product_histories, :shallow => true
  end
  resources :months

  
  
  
  # resources :customers do
  #   resources :orders
  #   end
  #   
  # resources :salespeople do
  #   resources :orders
  #   end
  
  
  
  
  
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
  root :to => "months#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

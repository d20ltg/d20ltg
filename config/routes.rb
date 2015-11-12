Rails.application.routes.draw do

  get 'stores/new'
  get 'stores/edit'
  get 'stores/create'
  get 'stores/update'
  get 'stores/show'
  get 'stores/index'

  get 'expansions/new'
  get 'expansions/edit'
  get 'expansions/create'
  get 'expansions/update'
  get 'expansions/show'
  get 'expansions/index'

  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/create'
  get 'events/upcoming'

  get 'recurring_events/new'
  get 'recurring_events/edit'
  get 'recurring_events/create'
  get 'recurring_events/update'
  get 'recurring_events/delete'
  get 'recurring_events/show'
  get 'recurring_events/index'

  get 'cards/index'
  get 'cards/show'
  get 'cards/new'
  get 'cards/edit'
  get 'cards/create'

  get 'announcements/index'
  get 'announcements/open'
  get 'announcements/new'
  get 'announcements/edit'

  root to: "static_pages#home"

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/magic'
  get 'static_pages/tabletop'
  get 'static_pages/comics'
  get 'static_pages/calendar'
  get 'static_pages/login'
  get 'static_pages/gatherer'

  resources :cards
  resources :announcements, only: [:index, :new, :create, :destroy]
  resources :events
  resources :recurring_events
  resources :stores
  resources :expansions


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

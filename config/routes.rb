Rails.application.routes.draw do

  get 'admin', :to => 'admin#index'

  get 'universes/index'
  get 'universes/show'
  get 'universes/edit'
  get 'universes/create'
  get 'universes/update'

  get 'comics/index'
  get 'comics/show'
  get 'comics/new'
  get 'comics/edit'
  get 'comics/create'
  get 'comics/update'
  get 'comics/destroy'

  root to: "static_pages#home"
  get 'home', :to => "announcements#splash_slider"

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'

  get 'carts/show'
  get 'carts/clear'
  get 'carts/complete'
  get 'carts/summary'

  get 'blocks/index'
  get 'blocks/show'
  get 'blocks/new'
  get 'blocks/edit'
  get 'blocks/create'

  get 'user/new'
  get 'user/index'
  get 'user/create'
  get 'user/destroy'
  get "login", :to => "sessions#login"
  get "logout", :to => "sessions#logout"

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

  get 'tabletop_games/new'
  get 'tabletop_games/edit'
  get 'tabletop_games/create'
  get 'tabletop_games/update'
  get 'tabletop_games/show'
  get 'tabletop_games/index'

  get 'games/index'
  get 'games/edit'
  get 'games/new'
  get 'games/show'

  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/create'
  get 'events/upcoming'

  get 'recurring_events/new'
  get 'recurring_events/edit'
  post 'recurring_events/create'
  get 'recurring_events/update'
  get 'recurring_events/show'
  get 'recurring_events/index'

  get 'cards/index'
  get 'cards/show'
  get 'cards/new'
  get 'cards/edit'
  get 'cards/create'
  get 'cards/search'

  get 'announcements/index'
  get 'announcements/open'
  get 'announcements/new'
  get 'announcements/edit'

  get 'static_pages/home'
  #get 'static_pages/about'
  #get 'static_pages/contact'
  #get 'static_pages/magic'
  #get 'static_pages/tabletop'
  #get 'static_pages/calendar'
  #get 'static_pages/login'
  #get 'static_pages/gatherer'

  get 'sessions/create'
  post 'sessions/login_attempt'
  get 'sessions/login'
  get 'sessions/destroy'

  resources :users, :only => [:index, :new, :create, :destroy, :login]
  resource :cart, only: [:show, :clear, :complete, :summary]
  resources :order_items, only: [:create, :update, :destroy]
  resources :cards
  resources :announcements, only: [:index, :new, :create, :destroy]
  resources :events
  resources :recurring_events
  resources :stores
  resources :blocks
  resources :expansions
  resources :tabletop_games
  resources :games
  resources 'sessions', :only => [:new, :create, :destroy]
  resources :comics
  resources :universes

end

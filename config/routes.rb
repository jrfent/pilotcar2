Pilotcar::Application.routes.draw do
  resources :bids
  resources :pins
  
  resources :listings do
    collection do
      get 'search'
    end
    resources :notifications
    resources :pins
  end
  
  resources :notifications
  resources :pins
  
  resources :categories do
    resources :subcategories do
      resources :listings
  end
  end

  devise_for :users
  
  resources :loads do
    resources :bids
  end 
  
  devise_for :truckers
  devise_for :pilots #, controllers: { registrations: "pilots/registrations", sessions: "pilots/sessions" }
  
  #static page routes
  #root "loads#index"
  root "pages#home"
  get "testhome" => "pages#home2"
  get "contact" => "pages#contact"
  get "about" => "pages#about"
  get "signup" => "pages#signup"
  get "privacystatement" => "pages#privacy"
  
  #custom routes
  get "/loads/:id/clone"	=> "loads#clone"
  get "clone" => "loads#clone"
  match '/mylistings', to: 'listings#mylistings', via: :get
  match '/subcategories/find_by_category', to: 'subcategories#find_by_category', via: :post
  get "/states" => "categories#index"
  
  get 'sitemap.xml', :to => 'sitemap#index', :defaults => { :format => 'xml' }
end

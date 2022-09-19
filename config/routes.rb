Rails.application.routes.draw do
  devise_for :accounts, controllers: { registrations: 'registrations' }
  #devise_for :accounts
  get 'home/home'
  resources :blocks do
    member do
      patch :move
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get ':landingpage_url', to: 'home#landingpage'
  
  get ':landingpage_url/edit', to: 'landingpages#edit', as: 'friendly_edit_landingpage'
  
  resources :landingpages
  
  #get '/:landingpage_url' => 'landingpages#show'
  root "home#home"
  #redirect_to 'home#error_routing'
  
  # If no route matches, redirect to the root path
  get '*path', to: redirect('/')
end

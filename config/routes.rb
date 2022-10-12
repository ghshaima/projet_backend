Rails.application.routes.draw do
  resources :users do 
    member do 
      get :confirm_email
    end
  end
  resources :demands
  resources :motifs
  resource :sessions, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

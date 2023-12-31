Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :doctors do
    member do
      patch :update_available
    end

    resources :educations, only: [:new, :create]
  end

  resources :patients do
    member do
      patch :update_cure
    end

      resources :appointments, only: [:new, :create]
  end

end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    resources :admins do
      resources :users
    end
  end

  namespace :api do 
    resources :users do 
      resources :komentars
    end
  end

  namespace :api do 
    resources :project_page, only: [:index, :create, :update, :destroy]
  end

  namespace :api do
    resources :personal_blog, only: [:index, :create, :update, :destroy]
  end

  namespace :api do
    resources :travel_blog, only: [:index, :create, :update, :destroy]
  end

end

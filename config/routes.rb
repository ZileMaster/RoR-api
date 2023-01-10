Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    resources :admins do
      resources :users do
        resources :komentars
      end
      resources :notice_boards do
        resources :infos
      end
    end
  end
  
  namespace :api do
    post '/register/users', to: 'users#create'
    post '/login/users', to: 'users#show'
  end

  namespace :api do
    post '/register/admins', to: 'admins#create'
    post '/login/admins', to: 'admins#show'
  end

  namespace :api do 
    resources :users do 
      resources :komentars
    end
  end

  namespace :api do 
    resources :project_pages
  end

  namespace :api do
    resources :personal_blogs
  end

  namespace :api do
    resources :travel_blogs
  end

end

Treebook::Application.routes.draw do
  
  as :user do
    get '/register', to: 'devise/registrations#new',via: :get, as: :register
    get '/login', to: 'devise/sessions#new',via: :get, as: :login
    get '/logout', to: 'devise/sessions#destroy',via: :get, as: :logout
  end

  
  devise_for :users                    
  

  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :new_user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :user_friendships do
    member do
      put :accept
      put :block
    end
  end

  #resources :passwords

  resources :statuses
  get 'feed', to: 'statuses#index', as: :feed
  root to: 'statuses#index'

  scope ":profile_name" do
    resources :albums do
      resources :pictures
    end
  end

  get '/:id', to: 'profiles#show', as: 'profile'


  
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users, only: [:index, :show, :new, :create]
        resources :lists, only: [:index, :show, :new, :create]
          post '/login', to: 'auth#create'
          post '/forgot-password', to: 'passwords#forgot'
          post '/reset-password', to: 'passwords#reset'
    end
  end
end

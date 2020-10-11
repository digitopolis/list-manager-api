Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :users, only: [:index, :show, :new, :create]
        resources :lists, only: [:index, :show, :new, :create]
        resources :items, only: [:index, :show, :new, :create]
          post '/login', to: 'auth#create'
          post '/forgot-password', to: 'passwords#forgot'
          post '/reset-password', to: 'passwords#reset'
          post '/mark-complete', to: 'items#complete'
          post '/add-to-list', to: 'items#add_to_list'
    end
  end
end

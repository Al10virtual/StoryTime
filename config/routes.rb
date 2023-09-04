Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get :profile, to: 'families#show'
  # (If 1 kid, root to kids#show -> mais il faut penser à la gestion du compte parents)
  # get 'profile', to: 'pages#profile', as: 'profile'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :kids, except: :index do
    resources :stories, except: %i[edit update]
    resources :answers, only: %i[new create]
    # resources :environments
    # éventuellemment except index, si toutes les stories sont dans la show du kid
  end

  resources :families, except: %i[index edit update] do
    resources :kids, only: %i[new create]
    resources :user_families, only: %i[new create]
  end

  resources :answers, only: :destroy
end

Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'home/index'
  get 'new', to: 'discussion_threads#new'
  root 'home#index'

  get 'login', to: 'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :discussion_threads, except: [:index]
  # get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'


  resources :discussion_threads do
    resources :comments, only: [:create, :destroy]
  end

end

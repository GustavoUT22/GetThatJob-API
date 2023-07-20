Rails.application.routes.draw do
  # get 'follows/index'
  # get 'follows/new'
  # get 'follows/show'
  # get 'follows/create'
  # get 'follows/destroy'
  # get 'follows/update'
  # get 'applications/index'
  # get 'applications/new'
  # get 'applications/show'
  # get 'applications/create'
  # get 'applications/destroy'
  # get 'applications/update'
  # get 'jobs/index'
  # get 'jobs/new'
  # get 'jobs/show'
  # get 'jobs/create'
  # get 'jobs/destroy'
  # get 'jobs/update'
  # get 'job/index'
  # get 'job/new'
  # get 'job/show'
  # get 'job/create'
  # get 'job/destroy'
  # get 'job/update'
  # get 'recruiters/index'
  # get 'recruiters/new'
  # get 'recruiters/show'
  # get 'recruiters/create'
  # get 'recruiters/destroy'
  # get 'recruiters/update'
  # get 'professionals/index'
  # get 'professionals/new'
  # get 'professionals/show'
  # get 'professionals/create'
  # get 'professionals/destroy'
  # get 'professionals/update'
  # get 'sessions/index'
  # get 'sessions/new'
  # get 'sessions/show'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'sessions/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post "/signup" => "sessions#create"
  post "/login/professionals" => "sessions#create"
  delete "/logout/professionals" => "sessions#destroy"
  resources :professionals, only: :create
  get "/profile/professionals", to: "professionals#show"
  patch "/profile/professionals", to: "professionals#update"

  post "/login/recruiters" => "recsessions#create"
  delete "/logout/recruiters" => "recsessions#destroy"
  resources :recruiters, only: :create
  get "/profile/recruiters", to: "professionals#show"
  patch "/profile/recruiters", to: "professionals#update"

  # resource :profile, except: %i[index create], controller: :professionals
  resources :jobs
  resources :follows

end

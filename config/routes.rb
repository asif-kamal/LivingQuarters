Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  resources :locations do
    resources :attractions
  end

  resources :attractions do
    resources :assignments
  end

  resources :experience_reports , only: [:new, :create]

  resources :assignments

  resources :hosts do
    resources :assignments, only: [:show, :index, ]
    resources :experience_reports, shallow: true
  end


  get '/auth/facebook/callback' => 'sessions#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end

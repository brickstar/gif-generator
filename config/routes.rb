Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, shallow: true do
    resources :favorites
  end

  resources :gifs, only: [:index, :show]

  namespace :admin do
    resources :gifs
    resources :categories
  end
end

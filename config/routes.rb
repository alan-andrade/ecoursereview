Ecoursereview::Application.routes.draw do
  resource :users
  resources :courses
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'courses#index'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match "/:provider/:slug" => "courses#show"
  match "/:subject" => "courses#subject"
end

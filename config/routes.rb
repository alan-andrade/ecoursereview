Ecoursereview::Application.routes.draw do
  resources :courses
  root to: 'courses#index'

end

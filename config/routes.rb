Ecoursereview::Application.routes.draw do
  root to: 'courses#index'
  resource :users
  resources :courses
  match "/:provider/:slug" => "courses#show"
  match "/:subject" => "courses#subject"
end

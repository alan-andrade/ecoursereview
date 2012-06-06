Ecoursereview::Application.routes.draw do
  resource :users
  resources :courses
  root to: 'courses#index'
  match "/:provider/:slug" => "courses#show"
  match "/:subject" => "courses#subject"
end

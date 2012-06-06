Ecoursereview::Application.routes.draw do
  resources :courses
  root to: 'courses#index'
  match "/:provider/:slug" => "courses#show"
end

Ecoursereview::Application.routes.draw do
  resource :users
  resources :courses do
     resources :course_reviews do
         resources :users
    end 
  end
  resource :course_reviews
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'courses#index'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/course-reviews/new', to: 'course_reviews#create'
  match "/subject/:subject" => "courses#subject"
  match "/provider/:provider" => "courses#provider"
  match "/:provider/:slug" => "courses#show"
end

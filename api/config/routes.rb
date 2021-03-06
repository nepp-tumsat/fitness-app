Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :auth do
      resources :sessions, only: %i[index]
  end
  resources :targets
  resources :user_body_compositions
  resources :memos
  resources :trainings
  resources :training_contents
  resources :user_diet_logs
  resources :scraped_foods
  resources :user_created_foods
end

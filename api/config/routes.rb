Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :auth do
      resources :sessions, only: %i[index]
  end
  resources :targets
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users'
      resources :journeys
      get 'my_journeys', to: 'journeys#my_journeys'
      scope 'journeys/:id/' do
        resources :journey_logs, only: :create
      end
    end
  end
end

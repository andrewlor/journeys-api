Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users'
      resources :journeys, param: :journey_id
      get 'my_journeys', to: 'journeys#my_journeys'
      scope 'journeys/:journey_id/' do
        put 'commits/:commit_id', to: 'commits#edit'
        resources :journey_logs, only: :create
        resources :commit_periods, only: :create
        scope 'commit_periods/:commit_period_id/' do
          resources :commits, only: :create
        end
      end
    end
  end
end

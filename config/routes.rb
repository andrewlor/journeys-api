Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Devise
      mount_devise_token_auth_for 'User', at: 'users', controllers: { registrations: 'user/registrations'}

      # Journeys
      resources :journeys, param: :journey_id
      get 'my_journeys', to: 'journeys#my_journeys'
      
      scope 'journeys/:journey_id/' do

        # Logs
        resources :journey_logs, only: :create

        # Commits
        put 'commits/:commit_id', to: 'commits#edit'
        scope 'commit_periods/:commit_period_id/' do
          resources :commits, only: :create
        end

        # Commit Periods
        resources :commit_periods, only: :create
      end
    end
  end
end

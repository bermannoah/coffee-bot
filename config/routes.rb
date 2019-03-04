Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/coffee_brewing', to: 'coffee#create'
      post '/kettle_brewing', to: 'coffee#create'
      get '/coffee_brewing', to: 'coffee#show'
      post '/last_brewed', to: 'coffee#show' # alias for new slack requirements
    end
  end

  root to: 'coffee#index'
  get '/auth/slack/callback', to: 'sessions#create'
  get '/logout',              to: 'sessions#destroy'
  get '/auth/failure',             to: 'sessions#failure'

  get '/cookies', to: 'coffee#cookies'
  get '/privacy', to: 'coffee#privacy'
end

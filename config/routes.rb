Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      post '/coffee_brewing', to: 'coffee#create'
      post '/kettle_brewing', to: 'kettle#create'
      post '/make', to: 'make#create'
      get '/coffee_brewing', to: 'coffee#show'
    end
  end
  
  root to: "coffee#index"
  if Rails.env.test?
    get  '/auth/slack/callback', to: 'sessions#create'
    get '/logout',              to: 'sessions#destroy'
    get  '/sign_in_with_slack',  to: 'sessions#new'
  end
  
  get '/cookies', to: 'coffee#cookies'
  get '/privacy', to: 'coffee#privacy'
end

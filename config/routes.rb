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
  get '/cookies', to: 'coffee#cookies'
  get '/privacy', to: 'coffee#privacy'
end

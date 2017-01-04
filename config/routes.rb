Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      post '/coffee_brewing', to: 'coffee#create'
      get '/coffee_brewing', to: 'coffee#show'
      post '/make', to: 'make#create'
    end
  end
  
  root to: "coffee#index"
  get  '/auth/slack/callback', to: 'sessions#create'
  get '/logout',              to: 'sessions#destroy'
  get  '/sign_in_with_slack',  to: 'sessions#new'

  get '/coffee_info', to: 'coffee#info'
  get '/list_of_brews', to: 'coffee#show'
  get '/how_to_brew', to: 'coffee#how'


end

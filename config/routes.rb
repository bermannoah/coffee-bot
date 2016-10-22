Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      post '/coffee_brewing', to: 'coffee#create'
      get '/coffee_brewing', to: 'coffee#show'
    end
  end
  
  namespace :api do
    namespace :v1 do
      get "/", to: "coffee#index"
    end
  end
  

end

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      post '/coffee_brewing', to: 'coffee#create'
    end
  end

end

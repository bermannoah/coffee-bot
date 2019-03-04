Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :slack, ENV['API_KEY'], ENV['API_SECRET'], scope: 'incoming-webhook, commands'
  end

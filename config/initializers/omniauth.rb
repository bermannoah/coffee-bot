Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, 'API_KEY', 'API_SECRET', scope: 'identity.basic'
end
# OmniAuth.config.on_failure = SessionsController.action(:new)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, name: 'steam', identifier: 'http://steamcommunity.com/openid'
end

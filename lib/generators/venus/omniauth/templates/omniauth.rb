Rails.application.config.middleware.use OmniAuth::Builder do
  Setting.providers.each do |provider_name|
    provider provider_name, Setting.send("#{provider_name}_token"), Setting.send("#{provider_name}_secret")
  end
end

OmniAuth.config.path_prefix = '/users/auth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '587748278082312', '653f038ce5648e38a231609066407d86'
end

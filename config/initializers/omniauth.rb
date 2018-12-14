require_relative '../../lib/omniauth/strategies/garmin'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '587748278082312', '653f038ce5648e38a231609066407d86'

  provider OmniAuth::Strategies::Garmin, '1af848bf-6f7a-469f-9124-ad4c76a15131', 'he0N96UN6rFUhO5TSKbtKgLMuKVcnQ3npQs', :setup => true
end

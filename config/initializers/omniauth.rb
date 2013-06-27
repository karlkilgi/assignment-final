Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '188352644663656', '59cad5781fcd4c27897d45c9e1fc9e5e'
end
Resend.configure do |config|
  config.api_key = ENV.fetch('RESEND_API_KEY', 'resend-api-key-not-set')
end

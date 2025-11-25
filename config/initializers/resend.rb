# Compatibility patch for Mail gem with Resend
if defined?(Mail::DateField)
  class Mail::DateField
    def unparsed_value
      @unparsed_value || value
    end
  end
end

if defined?(Mail::Field)
  class Mail::Field
    def unparsed_value
      @unparsed_value || value
    end
  end
end

Resend.configure do |config|
  config.api_key = ENV.fetch('RESEND_API_KEY', 'resend-api-key-not-set')
end

require 'net/http'
require 'json'
require 'base64'

class ResendDeliveryMethod
  attr_accessor :settings

  def initialize(settings)
    @settings = settings
  end

  def deliver!(mail)
    api_key = ENV['RESEND_API_KEY']
    raise 'RESEND_API_KEY environment variable not set' unless api_key

    # Prepare email data
    # Preserve full "Display Name <email@domain.com>" format for from field
    from_field = if mail.from&.any?
                   # Check if mail.from contains display name format
                   if mail[:from].display_names.any? && mail[:from].addresses.any?
                     "#{mail[:from].display_names.first} <#{mail[:from].addresses.first}>"
                   else
                     mail.from.first
                   end
                 else
                   'noreply@example.com'
                 end

    email_data = {
      from: from_field,
      to: mail.to,
      subject: mail.subject,
      html: mail.html_part&.body&.decoded || mail.body.decoded,
      text: mail.text_part&.body&.decoded
    }

    # Add CC and BCC if present
    email_data[:cc] = mail.cc if mail.cc&.any?
    email_data[:bcc] = mail.bcc if mail.bcc&.any?

    # Add reply-to if present
    email_data[:reply_to] = mail.reply_to if mail.reply_to&.any?

    # Add attachments if present
    if mail.attachments.any?
      email_data[:attachments] = mail.attachments.map do |attachment|
        {
          filename: attachment.filename,
          content: Base64.strict_encode64(attachment.body.decoded),
          content_type: attachment.content_type
        }
      end
    end

    # Remove nil values
    email_data.compact!

    # Send via Resend API
    uri = URI('https://api.resend.com/emails')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{api_key}"
    request['Content-Type'] = 'application/json'
    request.body = email_data.to_json

    response = http.request(request)

    unless response.code.to_i == 200
      error_message = "Resend API error: #{response.code} - #{response.body}"
      Rails.logger.error(error_message)
      raise error_message
    end

    Rails.logger.info("Email sent via Resend API: #{JSON.parse(response.body)['id']}")
    response
  end
end

# Register the custom delivery method
ActionMailer::Base.add_delivery_method :resend_api, ResendDeliveryMethod

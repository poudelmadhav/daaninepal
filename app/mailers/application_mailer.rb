class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("DEFAULT_FROM_EMAIL") { "Daani Nepal<noreply@paudelmadhav.com.np>" }
  layout 'mailer'
end

# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
	def welcome_mail_preview
	    WelcomeMailer.donation_received(User.first)
	end
end

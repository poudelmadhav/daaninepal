class WelcomeMailer < ApplicationMailer
	default from: "donation@manchechahiyo.com"

	def welcome_email(user)
	   @user = user
	   mail(to: @user.email, subject: 'Donation request under review!')
	end

end

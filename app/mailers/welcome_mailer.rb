class WelcomeMailer < ApplicationMailer
	def welcome_email(user)
	   @user = user
	   mail(to: @user.email, subject: 'Donation request under review!')
	end

	def donation_received(seeker, donor, amount)
		@seeker = seeker
		@donor = donor
		@amount = amount
	   	mail(to: @seeker.email, subject: 'Donation Received!')
	end

	def thank_for_donation(user)
		@user = user
	   	mail(to: @user.email, subject: 'Thank you!')
	end

end

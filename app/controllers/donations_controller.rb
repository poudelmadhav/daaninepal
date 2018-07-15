class DonationsController < ApplicationController
	def create
		@donorform = Donorform.find(params["donorform_id"])
		@donation = @donorform.donations.create(donation_params.merge(user_id: current_user.id))
		Notification.create(recipient: @donorform.user, actor: current_user, action: "donated", notifiable: @donation)
		if @donation.valid?
			flash[:success] = "Donation Successful!"
			WelcomeMailer.thank_for_donation(current_user).deliver
			WelcomeMailer.donation_received(@donorform.user, current_user, @donation.donation_amount).deliver
			redirect_to root_path
		else
			flash[:alert] = "Invalid Amount!"
			redirect_to root_path
		end
	end

	private 

	def donation_params
		params.require(:donation).permit(:donorform_id, :user_id, :donation_amount)
	end
end

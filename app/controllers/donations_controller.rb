class DonationsController < ApplicationController
	def create
		@donorform = Donorform.find(params["donorform_id"])
		@donation = @donorform.donations.create(donation_params.merge(user_id: current_user.id))
		if @donation.valid?
			flash[:success] = "Donation Successful!"
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

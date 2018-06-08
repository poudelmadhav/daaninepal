class DonatedAmountsController < ApplicationController
	before_action :authenticate_user!

	def new
		@amount = DonatedAmount.new
	end

	def create
		@amount = current_user.donate_damounts.create(amount_params)
		if @amount.valid?
	  		flash[:success] = "You have successfully donated!"
	    	redirect_to root_path
	  	else
	  		flash[:alert] = "#{@post.errors.full_messages.join(',')}"
	    	render :new, status: :unprocessable_entity
	    end
	end

	private

	def amount_params
		params.require(:donated_amount).permit(:user_id, :damount, :donated_amount_id)
	end
end

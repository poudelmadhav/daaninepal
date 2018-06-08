class DonatedAmountsController < ApplicationController
	before_action :authenticate_user!


	def create
		@donorform = Donorform.find(params[:donated_amount_id])
		@donated_amount = @donorform.donated_amounts.create(amount_params.merge(user_id: current_user.id))
		if @donated_amount.valid?
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

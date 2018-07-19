# sending notification to user after donation
class UserNotificationService
  def initialize(user)
    @user = user
  end

  # send notifications
  def notify_donor
    WelcomeMailer.thank_for_donation(@user).deliver
  end

  def notify_receiver(receiver, donation)
  	@donation = donation
  	amount = @donation.donation_amount
  	# send email
    WelcomeMailer.donation_received(receiver, @user, amount).deliver
    #create notification of receiver profile
    Notification.create(recipient: receiver, actor: @user, action: "donated", notifiable: @donation)
  end
end
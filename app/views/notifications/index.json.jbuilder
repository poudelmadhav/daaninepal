json.array! @notifications do |notification|
	json.recipient notification.recipient
	json.actor notification.actor
	json.action notification.action
	json.notifiable notification.notifiable
	# json.notifiable do
	# 	json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	# end
	json.url "/"
end

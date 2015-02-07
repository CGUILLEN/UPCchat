class Message < ActiveRecord::Base
	Pusher.app_id = 105988
	Pusher.key = 'f7cae4c6582928db7698'
	Pusher.secret = 'f49edffe84df08aab8bb'

	after_create :send_to_pusher

	def send_to_pusher
		logger.info "Hi?"
		Pusher['UPCchat'].trigger("message:create", self.to_json)
	end
end

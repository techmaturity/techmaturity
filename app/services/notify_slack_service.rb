class NotifySlackService
	require "net/http"
	require "uri"

	def self.build
		new
	end

	def call(params)
		begin
			message_to_send = "#{params[:message]} - <mailto:#{params[:email]}|#{params[:name]}>"
			config = CONFIGS[:feedback_slack]
			url = URI.parse(config['endpoint'])
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			req = Net::HTTP::Post.new(url.request_uri)
			req.body = {
				'channel'=>config['channel_name'],
				'username'=>'Feedback-BOT',
				'text'=>message_to_send,
				'icon_emoji'=>':rocket:'
			}.to_json
			res = http.request(req)
			res.kind_of? Net::HTTPSuccess
		rescue => e
			# Log exception
		end
	end
end

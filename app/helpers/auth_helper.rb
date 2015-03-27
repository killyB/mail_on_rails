module AuthHelper


	REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!

	# Generates the login URL for the app.
	def get_login_url
	client = OAuth2::Client.new(ENV['O365_CLIENT_ID'],
	                            ENV['O365_KEY'],
	                            :site => "https://login.microsoftonline.com",
	                            :authorize_url => "/common/oauth2/authorize",
	                            :token_url => "/common/oauth2/token")

	login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url)
	end
	# Exchanges an authorization code for a token
	def get_token_from_code(auth_code)
	  client = OAuth2::Client.new(ENV['O365_CLIENT_ID'],
	                              ENV['O365_KEY'],
	                              :site => "https://login.microsoftonline.com",
	                              :authorize_url => "/common/oauth2/authorize",
	                              :token_url => "/common/oauth2/token")

	  token = client.auth_code.get_token(auth_code,
	                                     :redirect_uri => authorize_url,
	                                     :resource => 'https://outlook.office365.com')

	  access_token = token.token
	end

end
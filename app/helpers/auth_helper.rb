module AuthHelper


  REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(ENV['O365_CLIENT_ID'],
                                ENV['O365_KEY'],
                                :site => "https://login.microsoftonline.com",
                                :authorize_url => "/common/oauth2/authorize",
                                :token_url => "/common/oauth2/token")

    login_url = client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI)
  end
end
class MailController < ApplicationController

  def index
    token = session[:azure_access_token]
    if token
      # If a token is present in the session, get messages from the inbox
      conn = Faraday.new(:url => 'https://outlook.office365.com') do |faraday|
        # Outputs to the console
        faraday.response :logger
        # Uses the default Net::HTTP adapter
        faraday.adapter  Faraday.default_adapter  
      end

    # Get messages from the inbox
    # Sort by DateTimeReceived in descending orderby
    # Get the first 20 results
      response = conn.get do |request|
        request.url '/api/v1.0/Me/Messages?$orderby=DateTimeReceived desc&$top=20'
        request.headers['Authorization'] = "Bearer #{token}"
        request.headers['Accept'] = "application/json"
      end

      # Assign the resulting value to the @messages
      # variable to make it available to the view template.
      @messages = JSON.parse(response.body)['value']
    else
      # If no token, redirect to the root url so user
      # can sign in.
      redirect_to root_url
    end
  end
end
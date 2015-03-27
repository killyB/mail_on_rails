class AuthController < ApplicationController
  def gettoken
  token = get_token_from_code params[:code]
  session[:azure_access_token] = token
  redirect_to mail_index_url
  end
end

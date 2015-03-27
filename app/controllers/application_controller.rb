class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include AuthHelper

	def home
		#Display O365 logon link
		login_url = get_login_url
		render html: "<a href='#{login_url}'>Login and view O365 email.</a>".html_safe
	end
end


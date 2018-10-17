class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	include ActionController::HttpAuthentication::Digest::ControllerMethods
	include ActionController::HttpAuthentication::Token::ControllerMethods
	include ActionController::MimeResponds
	include ActionController::RequestForgeryProtection

end

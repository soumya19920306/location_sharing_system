class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	
	def configure_permitted_parameters  
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
	end
end

class HomesController < ApplicationController
	def index 
		
	end
	
	def show_all_users
		
	end
	
	def get_all_user_data
		json_data=User.get_all_user_data_json
		render :json => json_data
	end
end

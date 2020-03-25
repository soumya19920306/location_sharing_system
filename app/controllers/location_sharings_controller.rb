
class LocationSharingsController < ApplicationController
	def index
		@mode=params[:mode]
	end
	
	def share_location
	
	end
	
	def upload_shared_location
		 
		lat=params[:lat]
		lng=params[:lng]
		shared_to_arr=params[:user_id_arr].split(',')
		if shared_to_arr.length == 1 && shared_to_arr[0].downcase=='public'
			share_place=SharedPlace.create_shared_location(lat,lng,shared_to_arr[0],current_user)
		else
			shared_to_arr.each do |u|
				share_place=SharedPlace.create_shared_location(lat,lng,u,current_user)
			end
		end
		
		if share_place.valid?
			render :plain => "Successfully shared the location."
		else
			render :plain => "Location can not be shared."
		end
	end
	
	def get_my_shared_location
		mode=params[:mode]
		json_data=SharedPlace.get_my_shared_location(mode,current_user)
		render :json => json_data
	end
	
	def show_location
		@lng=params[:lng]
		@lat=params[:lat]
		
		render layout: false
	end 
	
	def show_all_users_public_location
		username=params[:username]
		@all_public_shared_location_arr=SharedPlace.get_all_public_shared_location_arr(username)
		puts "@all_public_shared_location_arr====>>#{@all_public_shared_location_arr.inspect}"
		render layout: false
	end
end

 
class SharedPlace < ApplicationRecord
	belongs_to :user
	def self.create_shared_location(lat,lng,shared_to,current_user)
		@user=User.find(current_user.id)
		@share_location=@user.shared_places.create(shared_latitude: lat,shared_longitude: lng, shared_to: "#{shared_to}")
		 
		return @share_location
	end
	
	def self.get_my_shared_location(mode,current_user)
		coldef=ApplicationController.helpers.my_shared_places_grid_header_hash
		if mode.to_i==1
			user_shared_location_data=SharedPlace.where("user_id=#{current_user.id}")
		else
			user_shared_location_data=SharedPlace.where("shared_to='#{current_user.id}' or (shared_to='public' and user_id != #{current_user.id})")
		end
		_arr=[]
		user_shared_location_data.each do |row|
			_hash={}
			_hash["shared_by"]=current_user.email
			if row.shared_to.downcase=='public'
				_hash["shared_to"]="Public"
			else
				_hash["shared_to"]=User.get_email_from_id(row.shared_to)
			end
			_hash["shared_latitude"]=row.shared_latitude
			_hash["shared_longitude"]=row.shared_longitude
			_hash["show_on_map"]="<input class='btn btn-primary btn-sm' type='button' value='Show'  onclick='show_location("+row.shared_longitude.to_s+","+row.shared_latitude.to_s+")' > "
			_arr << _hash 
		end
		return _arr
	end
	
	def self.get_all_public_shared_location_arr(username)
		user_id=User.get_id_from_username(username)
		all_public_shared_location_obj=SharedPlace.where("shared_to='public' and user_id = #{user_id}")
		all_coordinate_arr=[]
		all_public_shared_location_obj.each do |location_obj|
			coordinate_arr=[]
			coordinate_arr<<location_obj["shared_longitude"].to_f
			coordinate_arr<<location_obj["shared_latitude"].to_f
			all_coordinate_arr<<coordinate_arr
		end
		
		return all_coordinate_arr
	end
end

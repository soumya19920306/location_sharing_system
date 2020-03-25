class User < ApplicationRecord
	extend Devise::Models
	has_many :shared_places
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	  
	attr_writer :login

 
	validates :username, :presence => true, :uniqueness => { :case_sensitive => false }  	
	
	def login
		@login || self.username || self.email
	end
	
	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if username = conditions.delete(:login)
			where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => username }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_h).first
		end
    end
	
	def self.get_all_user_list_except_current_user(current_user_obj)
		return User.where("email <> '#{current_user_obj.email }'")
	end
	
	def self.get_email_from_id(user_id)
		return User.find(user_id).email
	end
	
	def self.get_id_from_username(username)
		return User.where("username='#{username}'").take["id"]
	end
	
	def self.get_all_user_data_json
		all_users_data=User.all
		_arr=[]
		all_users_data.each do |user|
			_hash={}
			_hash["email"]=user["email"]
			_hash["username"]=user["username"]
			_hash["show_on_map"]="<input class='btn btn-primary btn-sm' type='button' value='Show' onclick='show_all_public_location(&apos;"+user.username.to_s+"&apos;,"+user.id.to_s+")' > "
			_arr << _hash 
		end
		return _arr
	end
end

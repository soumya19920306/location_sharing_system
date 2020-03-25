module ApplicationHelper
	def get_all_user_list_except_current_user
		User.get_all_user_list_except_current_user(current_user)
	end
end

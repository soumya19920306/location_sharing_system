module HomesHelper
	def all_users_grid_header_hash 
		grid_header_config_arr=[]
		grid_header_config_arr <<  {"field" => "email","headerName"=>"Email","width" => 300,"hide" => false}
		grid_header_config_arr <<  {"field" => "username","headerName"=>"Username","width" => 300,"hide" => false}
		grid_header_config_arr <<  {"field" => "show_on_map","headerName"=>"Show Shared Public Locations","width" => 200,"hide" => false,"cellRenderer" => "htmlRenderer","filter" => false}
		
	   return grid_header_config_arr
	end
end

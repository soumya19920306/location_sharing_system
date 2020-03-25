module LocationSharingsHelper
	 def my_shared_places_grid_header_hash  
         
		grid_header_config_arr=[]
		grid_header_config_arr <<  {"field" => "shared_by","headerName"=>"Shared By","width" => 300,"hide" => false}
		grid_header_config_arr <<  {"field" => "shared_to","headerName"=>"Shared To","width" => 300,"hide" => false}
		grid_header_config_arr <<  {"field" => "shared_latitude","headerName"=>"Latitude","width" => 200,"hide" => false}
		grid_header_config_arr <<  {"field" => "shared_longitude","headerName"=>"Longitude","width" => 200,"hide" => false}
		grid_header_config_arr <<  {"field" => "show_on_map","headerName"=>"Show on Map","width" => 200,"hide" => false,"cellRenderer" => "htmlRenderer","filter" => false}
		
	   return grid_header_config_arr
	end
	
	
end

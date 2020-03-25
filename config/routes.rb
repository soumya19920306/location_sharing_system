Rails.application.routes.draw do
	devise_for :users, controllers: {
        sessions: 'users/sessions',
		registrations: 'users/registrations'
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	devise_scope :user do
		
		get 'login', to: 'users/sessions#new'
		get 'logout', to: 'users/sessions#destroy'
		get 'users', to: 'users/registrations#new'
	end
  
  
	root to: 'homes#index'
	
	get 'home',to: 'homes#index'
	get 'show_users', to: 'homes#show_all_users'
	get 'get_all_user_data', to: 'homes#get_all_user_data'
  
	get 'shared_places', to: 'location_sharings#index'
	get 'share_location', to: 'location_sharings#share_location'
	post 'upload_shared_location', to: 'location_sharings#upload_shared_location'
	get 'get_my_shared_location', to: 'location_sharings#get_my_shared_location'
	get 'show_location', to: 'location_sharings#show_location'
	#get 'show_all_users_public_location/:username', to: 'location_sharings#show_all_users_public_location'
	get ':username', to: 'location_sharings#show_all_users_public_location'
end

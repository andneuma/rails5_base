Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	root to: 'application#landing'

	get 'hello_world', to: 'hello_world#index'

	# User management
	devise_for :users
end

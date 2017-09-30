Rails.application.routes.draw do
	root to: 'application#landing'

	get 'hello_world', to: 'hello_world#index'

	# User management
	devise_for :users
end

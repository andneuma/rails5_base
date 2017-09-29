Rails.application.routes.draw do
	root to: 'application#landing'

	get 'hello_world', to: 'hello_world#index'
end

if Rails.env == 'development'
	User.destroy_all
	AdminUser.destroy_all

	User.create( name: 'Some name', email: 'user@test.com', password: 'secret', password_confirmation: 'secret' )
	AdminUser.create!(email: 'admin@test.com', password: 'secret', password_confirmation: 'secret')
end

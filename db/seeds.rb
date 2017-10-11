if Rails.env == 'development'
	# Seed Users
	User.destroy_all
	AdminUser.destroy_all

	User.create( name: 'Some name', email: 'user@test.com', password: 'secret', password_confirmation: 'secret' )
	AdminUser.create!(email: 'admin@test.com', password: 'secret', password_confirmation: 'secret')

	# Seed Settings
	Setting.destroy_all
	Setting.create(active: true)
	Setting.create(active: false, name: 'Some other config scheme')
end

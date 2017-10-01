if Rails.env == 'development'
	# Seed Users
	User.destroy_all
	AdminUser.destroy_all

	User.create( name: 'Some name', email: 'user@test.com', password: 'secret', password_confirmation: 'secret' )
	AdminUser.create!(email: 'admin@test.com', password: 'secret', password_confirmation: 'secret')

	# Seed Settings
	Setting.destroy_all
	Setting.create(name: 'No activation tokens',
								 active: true, activation_tokens_required: 0,
								 app_title: Faker::StarTrek.character)
	Setting.create(name: 'Needs activation tokens',
								 active: false, activation_tokens_required: 2,
								 app_title: Faker::StarTrek.character)
end

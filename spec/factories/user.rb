require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name.split(' ').join('_') }
    email { rand(36**10).to_s(36) + '@test.com'}
    # encrypted_password BCrypt::Password.create('secret', cost: 4)
		after(:build) { |u| u.password = u.password_confirmation = 'secret'}
  end
end


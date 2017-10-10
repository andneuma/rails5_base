FactoryGirl.define do
  factory :user do
    name { Faker::Name.name.split(' ').join('_') }
    email { rand(36**10).to_s(36) + '@test.com'}
    password 'secret'
  end
end


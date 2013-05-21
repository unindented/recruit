FactoryGirl.define do

  factory :admin do
    email                 { Faker::Internet.email }
    password              'changeme'
    password_confirmation 'changeme'
  end

end

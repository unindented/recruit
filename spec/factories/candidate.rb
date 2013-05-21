FactoryGirl.define do

  factory :candidate do
    name     { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email    { Faker::Internet.email(name) }
    comments { Faker::Lorem.paragraph(rand(3)) }
  end

end

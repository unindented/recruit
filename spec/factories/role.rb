FactoryGirl.define do

  factory :role do
    name { Faker::Company.position }
  end

end

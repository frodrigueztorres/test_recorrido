FactoryBot.define do
  factory :alert do
    name { "MyString" }
    city_origin { "MyString" }
    city_destination { "MyString" }
    bus_class { 1 }
    price { 1 }
  end
end

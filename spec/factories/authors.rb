FactoryBot.define do
    factory(:author) do
      first_name { Faker::Name.name }
      last_name { Faker::Name.last_name }
      phone_number { '567-412-312' }
    end
end
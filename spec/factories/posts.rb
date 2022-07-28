FactoryBot.define do
    factory(:post) do
      content { Faker::Lorem.sentence }
      title { Faker::Lorem.unique.sentence }
    end
end
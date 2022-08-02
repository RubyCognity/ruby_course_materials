FactoryBot.define do
    factory(:comment) do
      content { Faker::Lorem.sentence }
      post # to call post factory
    end
end
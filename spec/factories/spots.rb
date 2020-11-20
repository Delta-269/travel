FactoryBot.define do
  factory :spot do
    title { 'test' }
    category_id { 2 }
    area_id { 2 }
    address { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    association :user

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
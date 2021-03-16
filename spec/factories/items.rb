FactoryBot.define do
  factory :item do
    title   {"ボンゴレビアンコ"}  
    price     {1500}
    item_pr   {"美味しい"}
    category_id  {Faker::Number.between(from: 1,to: 10)}
    shipping_day_id {Faker::Number.between(from: 1,to: 3)}
    shipping_fee_id  {Faker::Number.between(from: 1,to: 2)}
    item_status_id  {Faker::Number.between(from: 1,to: 6)}
    prefecture_id  {Faker::Number.between(from: 1,to: 47)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/food_spaghetti_vongole_bianco.png"),filename: "vongole_bianco.png")
    end
  end
end

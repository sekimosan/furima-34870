FactoryBot.define do
  factory :order_address do
    postal_code {"123-4567"}
    prefecture_id {Faker::Number.between(from: 1,to: 47)}
    city {"朝日市"}
    house_number {"長山1-1"}
    building {"ハイツ長山"}
    phone_number {"08022224444"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
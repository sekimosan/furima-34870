FactoryBot.define do
  

  factory :user do
    nickname     {"ほたて"}
    email        {Faker::Internet.unique.email}
    password     {'1a'+ Faker::Internet.password(min_length: 4,)}
    password_confirmation  {password}
    last_name     {"山田"}
    first_name    {"花子"}
    last_name_kana   {"ヤマダ"}
    first_name_kana  {"ハナコ"}
    birthday   {Faker::Date.birthday}
  end  
end  
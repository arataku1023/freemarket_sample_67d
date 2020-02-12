FactoryBot.define do

  factory :item do
    name                      {""}
    detail                    {"冬服です"}
    price                     {"1500"}
    status                    {""}
    mail                      {"出品者負担"}
    mail_way                  {"ゆうパック"}
    user_id                   {1}
    category_id               {100}
    brand_id                  {1}
    arrival_date_id           {"1日"}
    prefecture_id             {1}
  end
end
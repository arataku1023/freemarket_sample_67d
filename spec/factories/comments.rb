FactoryBot.define do
  factory :comment do
    text { "MyText" }
    item { nil }
    user { nil }
  end
end

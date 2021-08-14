FactoryBot.define do
  factory :message do
    message { "I do not like TDD, is very confusing" }
    user { nil }
  end
end

FactoryBot.define do
  factory :proficiency_choice do
    choose { 1 }
    source { nil }
    proficiency { nil }
  end
end

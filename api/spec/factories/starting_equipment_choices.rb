FactoryBot.define do
  factory :starting_equipment_choice do
    choose { 1 }
    source { nil }
    equipment { nil }
  end
end

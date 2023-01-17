FactoryBot.define do
  factory :weapon do
    melee { false }
    martial { false }
    damage_type { 1 }
    damage_dice { '1d6' }
    range { 1 }
  end
end

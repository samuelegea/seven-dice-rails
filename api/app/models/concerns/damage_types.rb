module DamageTypes
  extend ActiveSupport::Concern

  included do
    enum damage_type: {
      "Acid" => 0,
      "Bludgeoning" => 1,
      "Cold" => 2,
      "Fire" => 3,
      "Force" => 4,
      "Lightning" => 5,
      "Necrotic" => 7,
      "Piercing" => 8,
      "Poison" => 9,
      "Psychic" => 10,
      "Radiant" => 11,
      "Slashing" => 12,
      "Thunder" => 13
    }
  end
end

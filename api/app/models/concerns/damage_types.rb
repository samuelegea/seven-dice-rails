module DamageTypes
  extend ActiveSupport::Concern

  included do
    enum damage_type: [
      :acid,
      :bludgeoning,
      :cold,
      :fire,
      :force,
      :lightning,
      :necrotic,
      :piercing,
      :poison,
      :psychic,
      :radiant,
      :slashing,
      :thunder
    ]
  end
end

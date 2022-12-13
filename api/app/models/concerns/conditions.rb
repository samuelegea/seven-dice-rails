module Conditions
  extend ActiveSupport::Concern

  included do
    enum damage_type: [
      :blinded,
      :charmed,
      :deafened,
      :exhaustion,
      :frightened,
      :grappled,
      :incapacitated,
      :invisible,
      :paralyzed,
      :petrified,
      :poisoned,
      :prone,
      :restrained,
      :stunned,
      :unconscious
    ]
  end
end

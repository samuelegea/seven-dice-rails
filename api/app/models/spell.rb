class Spell < ApplicationRecord
  enum school: [
    :abjuration,
    :conjuration,
    :divination,
    :enchantment,
    :evocation,
    :illusion,
    :necromancy,
    :transmutation
  ]
end

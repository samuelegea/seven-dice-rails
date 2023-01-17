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

  enum cast_type: [
    :action,
    :bonus_action,
    :reaction,
    :minute,
    :hour,
    :day,
  ]

  enum range_type: [
    :feet,
    :meters,
    :miles,
    :range_special,
    :self,
    :touch,
    :unlimited,
    :sight,
  ]

  enum duration_type: [
    :instantaneous,
    :duration_special,
    :until_dispelled,
    :rounds,
    :minutes,
    :hours,
    :days,
    :permanent
  ]

  enum area_of_effect_type: [:cube, :sphere, :line, :cone, :cylinder]

  private

  def somatic?
    components.include?('S')
  end

  def verbal?
    components.include?('V')
  end

  def material?
    components.include?('M')
  end
end

class Weapon < ApplicationRecord
  include DamageTypes

  has_and_belongs_to_many :weapon_properties
  has_one :equipment, as: :source
end

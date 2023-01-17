class Weapon < ApplicationRecord
  include DamageTypes

  has_and_belongs_to_many :weapon_properties
  has_one :equipment, as: :source

  validates_presence_of :damage_type

  # delegate :name, to: :equipment
end

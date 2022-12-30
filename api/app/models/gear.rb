class Gear < ApplicationRecord
  # This model Represents a Gear in the game, but also, tools and Kits

  has_one :equipment, as: :source
  has_many :gears_equipaments, dependent: :destroy
  has_many :contained_equipments, through: :gears_equipaments, class_name: 'Equipment'
end

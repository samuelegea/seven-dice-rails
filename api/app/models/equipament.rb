class Equipament < ApplicationRecord
  enum equipament_type: {
    "Weapon" => 0,
    "Armor" => 1,
    "Gear" => 2,
    "Vehicle" => 3,
    "Tool" => 4,
    "Equipment Pack" => 5,
    "Magic Item" => 6,
    "Other" => 7
  }

  belongs_to :equipament_category
  has_and_belongs_to_many :characters, join_table: "character_equipaments", foreign_key: "equipament_id"

  has_many :holded_contents, class_name: "EquipamentContent", foreign_key: "holder_id"
  has_many :holdees, through: :holded_contents, source: :holdee

  has_many :holder_contents, class_name: "EquipamentContent", foreign_key: "holdee_id"
  has_many :holders, through: :holder_contents, source: :holder

  # has_many :variants, class_name: "Equipament", foreign_key: "variant_of_id"
  # belongs_to :variant_of, class_name: "Equipament", optional: true
end

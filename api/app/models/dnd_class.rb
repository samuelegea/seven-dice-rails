class DndClass < ApplicationRecord
  has_many :proficiencies, as: :source
  has_many :proficiency_choices, as: :source
  has_many :starting_equipment, as: :source
  has_many :starting_equipment_choices, as: :source

end

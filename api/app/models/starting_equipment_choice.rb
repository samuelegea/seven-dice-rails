class StartingEquipmentChoice < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :equipment, class_name: 'Equipment', foreign_key: 'equipment_id'
end

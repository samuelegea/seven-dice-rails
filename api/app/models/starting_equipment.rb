class StartingEquipment < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :equipment
end

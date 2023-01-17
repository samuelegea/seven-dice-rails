class Equipment < ApplicationRecord
  self.table_name = 'equipments'

  include Costs

  belongs_to :source, polymorphic: true, foreign_key: :source_id
  belongs_to :equipment_category
  has_many :starting_equipments, class_name: 'StartingEquipment', foreign_key: 'equipment_id'
  has_many :starting_equipment_choices, class_name: 'StartingEquipmentChoice', foreign_key: 'equipment_id'

end

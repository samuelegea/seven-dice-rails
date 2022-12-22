class EquipamentContent < ApplicationRecord
  belongs_to :holder, class_name: 'Equipament', foreign_key: 'holder_id'
  belongs_to :holdee, class_name: 'Equipament', foreign_key: 'holdee_id'
end

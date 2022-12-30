class Equipment < ApplicationRecord
  self.table_name = 'equipments'

  include Costs

  belongs_to :source, polymorphic: true
  belongs_to :equipment_category


  delegate :name, to: :source
end

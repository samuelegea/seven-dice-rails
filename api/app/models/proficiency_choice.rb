class ProficiencyChoice < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :proficiency, class_name: 'Proficiency', foreign_key: 'proficiency_id'
end

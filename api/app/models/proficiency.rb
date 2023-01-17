class Proficiency < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_many :proficiency_choices, class_name: 'ProficiencyChoice', foreign_key: 'proficiency_id'
end

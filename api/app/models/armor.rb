class Armor < ApplicationRecord
  has_one :equipment, as: :source
end

class Character < ApplicationRecord
  belongs_to :race
  belongs_to :subrace
end

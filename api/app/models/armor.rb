class Armor < ApplicationRecord
  has_one :equipment, as: :source

  enum category: {
    'Light' => 0,
    'Medium' => 1,
    'Heavy' => 2,
    'Shield' => 3
  }
end

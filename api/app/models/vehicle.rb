class Vehicle < ApplicationRecord
  has_one :equipment, as: :source

  enum vehicle_category: {
    'Mounts and Other Animals' => 0,
    'Tack, Harness, and Drawn Vehicles' => 1,
    'Waterborne Vehicles' => 2
  }
end

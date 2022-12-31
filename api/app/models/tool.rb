class Tool < ApplicationRecord
  enum category: {
    "Artisan's Tools" => 0,
    "Gaming Sets" => 1,
    "Musical Instrument" => 2,
    "Other Tools" => 3
  }
end

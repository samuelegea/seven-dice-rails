class MagicItemContent < ApplicationRecord
  belongs_to :holder_equipament
  belongs_to :holded_equipament
end

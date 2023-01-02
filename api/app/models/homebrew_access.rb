class HomebrewAccess < ApplicationRecord
  belongs_to :character
  belongs_to :source, polymorphic: true
end
